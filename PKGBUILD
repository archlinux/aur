# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.4.5
pkgrel=2
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('KSMBD-MODULE' 'libnl')
provides=('samba')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("e22e5bef29ffa2670fc82c490ad4dc6eb00963b4f963dd1852c811b437c77ee1")

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
	install -Dm644 "ksmbd.service" "${pkgdir}/usr/lib/systemd/system/ksmbd.service"
}
