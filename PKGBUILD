# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

_qt_module=qtgraphicaleffects
pkgname="mingw-w64-qt5-graphicaleffects"
pkgver=5.4.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtGraphicalEffects module (mingw-w64)"
depends=('mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('LGPL')
url="http://qt-project.org"
_pkgfqn="${_qt_module}-opensource-src-$pkgver"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('3145c92da410e880a0124a25176ac9bc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make INSTALL_ROOT="${pkgdir}" install
    popd
  done
}
