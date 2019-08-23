# Maintainer: Dror Levin <spatz@psybear.com>

pkgname=houserat
pkgver=0.2.0
pkgrel=1
pkgdesc="Notifies when known devices connect to the network"
arch=(x86_64)
url="https://github.com/drrlvn/houserat"
license=(GPL3)
depends=(libpcap)
makedepends=(rust)
backup=(etc/houserat/config.toml)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('857b3e41af2ca46414912d2ad3d82dc7cbb2f7832a7af9af7df21a0dd131309eb2d9f661c5f676ecbb41671c5bdc0eaf170c273cb6fb67fa2e10d8fdd4c0629c')

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
