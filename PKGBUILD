# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.4.1
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('KSMBD-MODULE' 'libnl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "ksmbd.service")
sha256sums=("f1d32afc32039ac3c3f41bac336059893186794270af85c80bbd3942ba96cb0c"
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
