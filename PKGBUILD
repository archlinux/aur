# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=openipmi
_pkgname=OpenIPMI
pkgver=2.0.21
pkgrel=1
pkgdesc="An open code base to allow access to platform information using Intelligent Platform Management Interface (IPMI)."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/openipmi/"
depends=('popt' 'net-snmp' 'glib' 'glib2' 'tcl')
options=(!libtool)
license=("LGPL2.1")
source=(http://downloads.sourceforge.net/project/${pkgname}/${_pkgname}%202.0%20Library/${_pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	./configure --prefix=/usr

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install-exec
	make DESTDIR="${pkgdir}" install
	install -Dm644 doc/IPMI.pdf "${pkgdir}/usr/share/doc/${pkgname}/IPMI.pdf"
	mv "${pkgdir}"/usr/etc "${pkgdir}"
}

sha256sums=('37b844d02119b94b31e2bb2bd8062ffdf6cd3eb4bc75fa6c47184e8b14fe95b8')
