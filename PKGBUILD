pkgname=pipelam
pkgver=0.1.14
pkgrel=1
pkgdesc="A lightweight GTK4-based notification system for displaying text, images, and progress bars"
arch=('x86_64' 'aarch64')
url="https://github.com/thomascrha/pipelam"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('scdoc' 'git')
optdepends=('systemd: for systemd service')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thomascrha/pipelam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9744f035fa2703ac80c2f8bee41345146420c01c289f63c6d889ec5b8c8f5e3')

build() {
    cd "$pkgname-$pkgver"
    make build
    make docs
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir" install

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    make PREFIX="$pkgdir" install-systemd

    # # Install config file
    install -d "$pkgdir/etc/$pkgname"
    install -Dm644 config/pipelam.toml "$pkgdir/etc/$pkgname/pipelam.toml"
}

