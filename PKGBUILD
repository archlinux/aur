#Maintainer Solomon Choina <shlomochoina@gmail.com>
pkgname=kvirc-git
pkgver=5.2.2.r1.g5ddf504c5
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled with kde6 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL-2.0-only')
depends=('glibc' 'openssl' 'zlib' 'perl' 'qt6-svg'
  'qt6-multimedia' 'enchant' 'audiofile' 'libxss'
  'qt6-webengine' 'qt6-5compat' 'phonon-qt6' 'kio'
  'knotifications' 'kxmlgui' 'kparts' 'kstatusnotifieritem')
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
    -DCMAKE_SKIP_RPATH=YES \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE=ON \
    -DWANT_KDE=ON \
    -DWANT_OGG_THEORA=ON \
    -DWANT_DCC_VIDEO=OFF \
    -DWANT_GTKSTYLE=FF
  ninja -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install
}
