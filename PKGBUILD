# Maintainer: Bruno Van de Velde <bruno@texus.me>

pkgname=tgui-git
pkgver=0.7.4.r1.g16c65f7b
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

source=("git+https://github.com/texus/TGUI.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/TGUI"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/TGUI"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DTGUI_BUILD_DOC=true
  make
}

package() {
  cd "$srcdir/TGUI"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
