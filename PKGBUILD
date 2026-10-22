# Maintainer: Anjishnu Sengupta <itsaemail@duck.com>
pkgname=ny-cli
pkgver=7.0.1
pkgrel=1
pkgdesc="Beautiful terminal anime streaming client with artwork display, cloud sync, and watch progress tracking"
arch=('any')
url="https://github.com/AnjishnuSengupta/ny-cli"
license=('MIT')
depends=('nodejs>=20.18.0' 'npm')
optdepends=(
    'mpv: recommended video player with IPC support'
    'vlc: alternative video player'
    'chafa: terminal image rendering for artwork display'
)
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnjishnuSengupta/ny-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm pack
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    local tarball
    tarball=$(ls -1 anjishnusengupta-ny-cli-*.tgz 2>/dev/null | head -n 1)
    npm install -g --prefix "$pkgdir/usr" "$tarball"

    # Set sane directory permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Install license and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
