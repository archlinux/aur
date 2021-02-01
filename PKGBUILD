# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Dumitru Ursu <dima@ceata.org>

pkgname=opencolorio-git
pkgver=1.0.8.r586.gbc88857f
pkgrel=1
pkgdesc="A color management framework for visual effects and animation"
arch=('x86_64')
url="https://opencolorio.org"
license=('BSD')
depends=('freeglut' 'glew' 'lcms2' 'openexr' 'pystring' 'tinyxml' 'yaml-cpp')
makedepends=('boost' 'cmake' 'git' 'ninja' 'pybind11' 'python')
optdepends=('python: python bindings')
provides=('opencolorio')
conflicts=('opencolorio' 'opencolorio1')
source=("git+https://github.com/AcademySoftwareFoundation/OpenColorIO")
sha512sums=('SKIP')

pkgver() {
  cd OpenColorIO
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd OpenColorIO

  cmake \
    -GNinja \
    -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_DISABLE_FIND_PACKAGE_OpenImageIO=TRUE
  ninja -C build
}

package() {
  cd OpenColorIO

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
