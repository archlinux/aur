# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=plasma-mycroft
pkgname=plasma5-applets-mycroft-git
pkgver=r67.2e8a1ec
pkgrel=1
pkgdesc="Mycroft Ai Plasmoid / Widget for KDE Plasma 5 Desktop"
arch=("x86_64" "i686")
url="https://cgit.kde.org/plasma-mycroft.git/"
license=('GPL3')
depends=('qt5-websockets' 'qt5-quickcontrols2')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework' 'python')
optdepends=('mycroft-core: for using "Installed Using Mycroft Package"')
provides=("plasma5-applets-mycroft")
conflicts=("plasma5-applets-mycroft")
install=$pkgname.install
source=('git+https://anongit.kde.org/plasma-mycroft.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
}
