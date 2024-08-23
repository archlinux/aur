# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com> 
_pkgname=nintyfont
pkgname=$_pkgname-git
pkgver=1.0.alpha.2.r2.g38af946
pkgrel=2
pkgdesc="Nintendo binary font editor"
arch=('any')
url="https://github.com/hadashisora/NintyFont"
license=('GPL3')
groups=()
depends=('fmt9')
makedepends=('base-devel' 'qt5-base' 'cmake' 'git')
source=("${_pkgname}::git+https://github.com/hadashisora/NintyFont.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p "${_pkgname}/build"
	cd "${_pkgname}/build"
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make -j$(nproc)
	strip NintyFont
}

package() {
	cd "${_pkgname}/build"
	mkdir -p "$pkgdir/usr/bin"
	cp NintyFont "$pkgdir/usr/bin/"
}
