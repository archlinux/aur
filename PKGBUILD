# Maintainer: Jack Reitano <thnikk645@gmail.com>
pkgname=ovolay-bin
_pkgname=ovolay
pkgver=1.0.0
pkgrel=1
pkgdesc="Volume Overlay (Binary Release)"
arch=('x86_64')
url="https://github.com/thnikk/ovolay"
license=('MIT')
depends=(gtk4-layer-shell libpulse)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/ovolay-arch.zip")
sha256sums=('0103ac596f3fe5dbc6d4130bdf5b27b683f413ba66aaf73e8480e2cc6cfaddcc')

package() {
    # Install the application support files
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -dr --no-preserve=ownership "$srcdir/_internal" "$pkgdir/opt/$_pkgname/"

    # Install the binary with correct executable permissions
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"

    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # Install the license from the source archive
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
