pkgname=kvirc-git
pkgver=5.0.0.r47.g9b35d44fd
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled with kde5 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kwindowsystem' 'knotifications' 'kservice')
makedepends=('python2' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc')
source=("$pkgname::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_QT4=OFF \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE=ON \
    -DWANT_KDE=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
