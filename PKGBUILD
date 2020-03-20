# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=evtype
pkgver=0.1.0
pkgrel=1
pkgdesc="Virtual typing using evdev"
url="https://github.com/icewind1991/evtype"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/icewind1991/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('d320118d4fd692f622476a27d1b654e9a9a92b9e30b567c64b8634ae6b2880526e156d300848b59cded2b00509c9c3c380cc57022b80b9be09f21d88ba5f07d9')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "target/release/${pkgname}_daemon" "$pkgdir/usr/bin/$pkgname_daemon"
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

