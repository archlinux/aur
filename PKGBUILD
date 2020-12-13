# Contributor: derfenix <derfenix@gmail.com>

pkgname=neochat-git
pkgver=r1233.1ec6287
pkgrel=2
pkgdesc="A client for matrix, the decentralized communication protocol"
arch=('i686' 'x86_64')
url="https://invent.kde.org/network/neochat"
license=('GPL3')
depends=('libquotient-git' 'qtkeychain' 'qt5-quickcontrols2>=5.15.0' 'qt5-multimedia>=5.15.0' 'qt5-svg>=5.15.0' 'qt5-base>=5.15.0' 'kirigami2>=5.74.0' 'kitemmodels>=5.74.0' 'ki18n>=5.74.0' 'knotifications>=5.74.0' 'kconfig>=5.74.0' 'kcoreaddons>=5.74.0' 'kquickimageeditor')
makedepends=('cmark' 'cmake>=3.1.0' 'git' 'extra-cmake-modules') 
source=("neochat::git+https://invent.kde.org/network/neochat.git")
conflicts=('neochat')
provides=('neochat')
sha256sums=('SKIP')

pkgver() {
  cd "neochat"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd neochat
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
   cd "${srcdir}/neochat"
   make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
