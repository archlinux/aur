# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.4.6
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('KSMBD-MODULE' 'libnl')
provides=('samba')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("d7b27313c3e40c1272776d0bbc5672363dff0f1cad9286d6450f4907907685b9")

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --with-rundir=/run
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
