# Maintainer: Oguz Oztoprak <justiceoz@protonmail.com>

pkgname=nco-git
_pkgname=nco
pkgver=r14241.2940d4b61
pkgrel=1
pkgdesc="Manipulate and analyze data stored in netCDF-accessible formats"
arch=('x86_64')
url='http://nco.sourceforge.net'
license=('BSD')
depends=('netcdf' )
optdepends=('udunits' 'gsl' 'gadap' 'antlr2')
makedepends=('cmake')
source=('nco::git+https://github.com/nco/nco.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake ../nco \
    -DCMAKE_INSTALL_PREFIX=/usr/bin \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

package() {

  cmake --install build --prefix "${pkgdir}"/usr/bin

  install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
