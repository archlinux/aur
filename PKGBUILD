# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

_binname=Pencil
_pkgname_base=pencil
_pkgname=evolus-pencil
_version=3.0.0
_release=rc.2
_zipname="${_binname}_${_version}-${_release}_amd64.deb"
pkgname=${_pkgname}-bin
pkgver=${_version}_${_release}
pkgrel=1
pkgdesc="An open-source GUI prototyping tool - Evolus release"
arch=('x86_64')
url="http://pencil.evolus.vn/Next.html"
license=('GPL2')
depends=('gconf')
makedepends=('binutils' 'tar')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname_base)
source=("https://github.com/evolus/$_pkgname_base/releases/download/v${_version}-$_release/$_zipname"
	"${_pkgname_base}.desktop"
	"${_pkgname}-mime.xml")
sha1sums=('c988cfebc546e996d63925e44bdb2ddf122e35c8'
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
	cp -f "${srcdir}/${_pkgname_base}.desktop" "${pkgdir}/usr/share/applications/"

	# Mimetype file
	install -d "${pkgdir}/usr/share/mime/packages/"
	cp "${srcdir}/${_pkgname}-mime.xml" "${pkgdir}/usr/share/mime/packages/"
	
	# Cleanup
	rm -rf "${pkgdir}/opt"
	rm -rf "${pkgdir}/usr/share/doc"
}
