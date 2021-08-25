# Maintainer: eggix <eggix@protonmail.com>

pkgname=sail7-svn
pkgver=v0.07.r47
pkgrel=1
pkgdesc="A design and optimisation tool for sail performance."
arch=('i686' 'x86_64')
url="http://xflr5.tech/sail7/sail7.html"
_VERSION='v0.07'
_basename="${pkgname%-svn}"
provides=("${_basename}")
license=('GPL3')
depends=('qt5-base')
makedepends=('subversion')
source=("${pkgname}::svn+https://svn.code.sf.net/p/sail7/code/trunk"
				"sail7.desktop")
sha256sums=('SKIP'
            '3c75d5616c7733b92d4ff959885e29186a730c02ab85dbe2b03ac738f9fdd9d9')

pkgver() {
	cd "${pkgname}/sail7"
	local ver="$(svnversion)"
	printf "${_VERSION}.r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "${pkgname}/sail7"
	qmake-qt5 PREFIX=/usr
	make -j $(nproc)
}

package() {
	cd "${pkgname}/sail7"

	make -j $(nproc) INSTALL_ROOT="${pkgdir}" install

	install -Dm644 images/sail7.png "${pkgdir}/usr/share/${_basename}/${_basename}.png"
	install -Dm644 "${srcdir}/sail7.desktop" "$pkgdir/usr/share/applications/${_basename}.desktop"
}


