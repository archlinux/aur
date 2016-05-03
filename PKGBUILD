# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-virtualkeyboard
#_qtver=5.6.0
#pkgver=${_qtver/-/}
pkgver=1.3.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Virtual keyboard framework'
depends=('qt5-declarative')
makedepends=()
#groups=('qt' 'qt5')
#_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
#source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
source=("https://github.com/qtproject/qtvirtualkeyboard/archive/v$pkgver.tar.gz")
md5sums=('18522377feb87ebad6455e4b504f23d3')

prepare() {
  mkdir -p build
}

build() {
  cd build

#  qmake ../${_pkgfqn}
  qmake ../qtvirtualkeyboard-$pkgver
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
