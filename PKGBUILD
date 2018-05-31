pkgname=kvirc4-git-nokde
pkgver=r7326.85ef2059c
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled without kde5 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant')
makedepends=('python2' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc' 'kvirc4-git')
provides=('kvirc' 'kvirc4')
source=("$pkgname::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "${pkgname}"
}

build() {
  rm -rf build
  mkdir -p build
  cd build
  cmake ../"${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE:BOOL="1" \
    -DWANT_KDE:BOOL="0" \
    -DWANT_GTKSTYLE:BOOL="1"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
