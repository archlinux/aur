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
sha256sums=('88a7d6d675dd36ce21b2704979bafb9a7e9d319a373df0cab9eff6e82310d6d1')  # Will be updated by the workflow

package() {
    cd "$srcdir"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install systemd service
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install config file
    install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
}