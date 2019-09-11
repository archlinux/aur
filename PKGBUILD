# Maintainer: Dror Levin <spatz@psybear.com>

pkgname=houserat
pkgver=0.4.0
pkgrel=1
pkgdesc="Notifies when known devices connect to the network"
arch=(x86_64)
url="https://github.com/drrlvn/houserat"
license=(GPL3)
depends=(libpcap)
makedepends=(rust)
backup=(etc/houserat/config.toml)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('3f271a55a40e929837e3d7a2c02c9ddc977d761a2d3b5f5b1da5dbe826c3b9e4e8711e0665123548201b268048ee185c57b4fa857757c9647c39c22080e1fc13')

build() {
	cd $pkgname-$pkgver

    cargo build --release
}

package() {
	cd $pkgname-$pkgver

    install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 config.example.toml "$pkgdir"/etc/houserat/config.toml
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
