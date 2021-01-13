# Maintainer: Bruno Van de Velde <bruno@texus.me>

pkgname=tgui-git
pkgver=nightly_build.r47.g590fa71fe
pkgrel=1
pkgdesc="Cross-platform C++ GUI library for SFML"
arch=('i686' 'x86_64')
url="https://tgui.eu/"
license=('ZLIB')
depends=('sfml')
makedepends=('cmake' 'doxygen' 'git')
provides=('tgui')
conflicts=('tgui')
replaces=()

source=("git+https://github.com/texus/TGUI.git#branch=0.9-dev")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/TGUI"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/TGUI"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE \
        -DTGUI_BUILD_DOC=true
  make
}

package() {
  cd "$srcdir/TGUI"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
