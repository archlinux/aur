pkgname=kvirc-git
pkgver=4.3.2.r5739.214f716
_pkgver=4.3.2
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled with kde4 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kwindowsystem' 'knotifications' 'kservice')
makedepends=('python2' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("kvirc-git::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) -DWANT_QT4:BOOL="0" -DCMAKE_BUILD_TYPE:STRING="Release" -DWANT_AUDIOFILE:BOOL="1" -DWANT_KDE:BOOL="1" 
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
