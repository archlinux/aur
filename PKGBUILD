# Maintainer: DaarkWel <daarkwel at mail dot ru>
pkgname=fb2edit
pkgver=20220809
pkgrel=1
pkgdesc="FB2 ebooks editor, qt5 version"
arch=('i686' 'x86_64')
url="https://github.com/lintest/fb2edit"
license=('GPL3')
depends=('qt5-webkit' 'qt5-xmlpatterns' 'qt5-imageformats' 'qt5-translations' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools')

_gitname=fb2edit

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
	cd "${_gitname}"
	mkdir -p build
	cd "build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${_gitname}/build"
	make DESTDIR="${pkgdir}" install
}
