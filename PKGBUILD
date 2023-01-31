# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-bin
_pkgname_caps=ELAN
_pkgname=elan
pkgver="6.4"
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
provides=('elan')
conflicts=('elan')
license=('GPL3' 'apache')
source=("https://www.mpi.nl/tools/${_pkgname}/${_pkgname_caps}_${pkgver//\./\-}_linux.tar.gz"
		    "elan.desktop")
sha256sums=('04ac89213ed010e1d57cb6406e9a78970839d55d60b0e2c8cb7ffc3d69158379'
            '6e3c93fce73b04de31a381394c8db7a574de0eb69f76d93e65a430109a2bba23')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver//\./\-}/"
	install -d -m775 "${pkgdir}/opt/elan"
	cp -r "lib" "${pkgdir}/opt/elan/"
	cp -r "bin" "${pkgdir}/opt/elan/"
	chmod +x "${pkgdir}/opt/elan/bin/ELAN"
	install -d -m775 "${pkgdir}/usr/bin/"
	ln -s "/opt/elan/bin/ELAN" "${pkgdir}/usr/bin/elan"
	install -d -m775 "${pkgdir}/usr/local/share/applications/"
	install -D "${srcdir}/elan.desktop" "${pkgdir}/usr/local/share/applications/"
}
