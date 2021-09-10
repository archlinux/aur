# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.4.2
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('KSMBD-MODULE' 'libnl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "ksmbd.service")
sha256sums=("fb79bf9201321adb33f8a5f0a12bd205a86b2d4bb057a9f98e0e9521664c2bcd"
            "c97ef1a0fcd4357d3352b0e174547c02ce91563c342df10eec2bf2eba2c4a392")

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

	install -Dm 644 "${srcdir}/ksmbd.service" "${pkgdir}/usr/lib/systemd/system/ksmbd.service"
}
