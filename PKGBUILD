# Maintainer: Voislav Vasiljevski <voyo@thelazysre.com>
pkgname=observer
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic CPU core manager for power saving"
arch=('x86_64')
url="https://github.com/voioo/observer"
license=('0BSD')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
backup=('etc/observer/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
sha256sums=('d03398805e54f5d9ab45c96d700200f7e6d6c6eb314f17e61c8430ef6bb05462')  # Will be updated by the workflow

package() {
    cd "$srcdir"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install systemd service
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install config file
    install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
}