# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

_binname=Pencil
_pkgname_base=pencil
_pkgname=evolus-pencil
_version=3.0.0
_release=rc.1
_zipname="${_binname}-${_version}-${_release}.deb"
pkgname=${_pkgname}-bin
pkgver=${_version}_${_release}
pkgrel=1
pkgdesc="An open-source GUI prototyping tool - Evolus release"
arch=('x86_64')
url="http://pencil.evolus.vn/Next.html"
license=('GPL2')
depends=()
makedepends=('binutils' 'tar')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname_base)
source=("https://github.com/evolus/$_pkgname_base/releases/download/v${_version}-$_release/$_zipname"
	"$_pkgname.desktop")
sha1sums=('3773688558231bf3f25bf33e0ebce8d6619c100d'
	'8844653d3ce22669ef18d818ff986f317caf78ca')

package() {
	# Extract data
	tar xJf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
	
	# Package files
	mv "${pkgdir}/opt/$_binname" "${pkgdir}/usr/share/$_pkgname"
	
	# Binary file
	install -d "${pkgdir}/usr/bin/"
	ln -s "../share/${_pkgname}/${_binname}" "${pkgdir}/usr/bin/${_pkgname_base}"
	
	# Desktop file
	cp -L "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	
	# Cleanup
	rm -rf "${pkgdir}/opt"
	rm -rf "${pkgdir}/usr/share/doc"
	rm "${pkgdir}/usr/share/applications/${_binname}.desktop"
}
