# Maintainer: Dror Levin <spatz@psybear.com>

pkgname=houserat
pkgver=0.3.1
pkgrel=1
pkgdesc="Notifies when known devices connect to the network"
arch=(x86_64)
url="https://github.com/drrlvn/houserat"
license=(GPL3)
depends=(libpcap)
makedepends=(rust)
backup=(etc/houserat/config.toml)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('c3a43493bdf124f38d265888df455cd8723f42b55607a65ee7b1fb3992ac545a1fa2fbc47de3a010ab09b4bd24a1f2d2abeb1b605ae95b2a43f2af85964fd6d9')

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
