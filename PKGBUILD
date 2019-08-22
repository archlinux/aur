# Maintainer: Dror Levin <spatz@psybear.com>

pkgname=houserat
pkgver=0.1.0
pkgrel=1
pkgdesc="Notifies when known devices connect to the network"
arch=(x86_64)
url="https://github.com/drrlvn/houserat"
license=(GPL3)
depends=(libpcap)
makedepends=(rust)
backup=(etc/houserat/config.toml)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('86673e1a7fc588e9fa941caa27d0ef183a8663191eeeb24a47fc9cfe78c1dea6ca9a39fc7170c43c43a749c8c8bb2efbbc0f1b82486d9d3b15e0d10ce6e57e5f')

build() {
	cd $pkgname-$pkgver

    cargo build --release
}

package() {
	cd $pkgname-$pkgver

    install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 config.toml.example "$pkgdir"/etc/houserat/config.toml
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
