#Maintainer Solomon Choina <shlomochoina@gmail.com>
pkgname=kvirc-git
pkgver=5.2.0.r10.g6b57a7bef
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled with kde5 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL-2.0-only')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg'
         'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant' 'kcoreaddons5'
         'ki18n5' 'kxmlgui5' 'kwindowsystem5' 'knotifications5'
         'kservice5' 'audiofile' 'libxss' 'qt5-webengine')
makedepends=('python' 'ninja' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc')
source=("$pkgname::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  cmake -B _build \
    -S "${pkgname}" \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE=ON \
    -DWANT_KDE=ON \
    -DWANT_OGG_THEORA=ON \
    -DWANT_DCC_VIDEO=ON \
    -DWANT_GTKSTYLE=ON
  ninja -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install
}
