# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

_binname=Pencil
_pkgname_base=pencil
_pkgname=evolus-pencil
_desktopfile="${_pkgname_base}.desktop"
_mimefile="${_pkgname}-mime.xml"

pkgname=${_pkgname}-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="An open-source GUI prototyping tool - Evolus release"
arch=('x86_64')
url="http://pencil.evolus.vn/"
license=('GPL2')
depends=('gconf')
makedepends=('binutils' 'tar')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname_base)
source=("http://pencil.evolus.vn/dl/V${pkgver}/${_binname}_${pkgver}_amd64.deb"
	"${_desktopfile}"
	"${_mimefile}")
sha1sums=('adc4f66ce2a7f3881350b4b38eaa0e6a6de78dfd'
	'fd1a937f77388e46917fa566000acd89c5d181c3'
	'975e4818189aa041bfe4df6e20c69d82cd130298')

package() {
	# Extract data
	tar xJf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
	
	# Package files
	mv "${pkgdir}/opt/$_binname" "${pkgdir}/usr/share/$_pkgname"
	
	# Binary file
	install -d "${pkgdir}/usr/bin/"
	ln -s "../share/${_pkgname}/${_pkgname_base}" "${pkgdir}/usr/bin/${_pkgname_base}"
	
	# Desktop file
	cp -f "${srcdir}/${_desktopfile}" "${pkgdir}/usr/share/applications/"

	# Mimetype file
	install -d "${pkgdir}/usr/share/mime/packages/"
	cp "${srcdir}/${_mimefile}" "${pkgdir}/usr/share/mime/packages/"
	
	# Cleanup
	rm -rf "${pkgdir}/opt"
	rm -rf "${pkgdir}/usr/share/doc"
}
