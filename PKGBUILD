# Maintainer: Hurstel Alexandre <a.hurstel@unistra.fr>
_pkgname=ASTex
pkgname=astex-git
pkgver=r14.457e085
pkgrel=1
pkgdesc="ASTex is an open-source library for texture analysis and synthesis."
arch=('i686' 'x86_64')
url="https://astex-icube.github.io"
license=('GPL')
depends=('insight-toolkit' 'libpng' 'openexr')
makedepends=('git' 'cmake>=3.0.0' 'gcc>=4.9')
provides=('astex')
conflicts=('astex')
source=(
        "git://github.com/ASTex-ICube/ASTex.git"
)

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${_pkgname}-build"
	cd "${_pkgname}-build"
	cmake ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/${_pkgname}-build"
	make DESTDIR="$pkgdir/" install
}

md5sums=('SKIP')

