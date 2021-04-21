# Maintainer: Leo Papadakos <jpegxguy@outlook.com>

pkgname=ksmbd-tools
pkgver=3.3.9
pkgrel=1
pkgdesc="Userspace tools for the cifsd/ksmbd kernel server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('ksmbd-dkms')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cifsd-team/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("7c2c86130912d780df69f26d797d4bd88cf31876a86fdad17032ab684bfe7d8a")

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
