# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=3db8927f28dc2b5996da61e39292a3bb9743438f
_gitsha256='a5b7c895a52e6cdae62cd0f1687b188f50c20cfd0381b1eb919b98b9aca56e05'

pkgbase=octopi-notifier-qt5
pkgname=('octopi-notifier-qt5')
pkgver=0.9.0
pkgrel=24
pkgdesc="Notifier for Octopi using Qt5 libs"
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=("octopi-dev" 'libnotify')
makedepends=('qt5-tools')
optdepends=('xfce4-notifyd: for notifications in XFCE')
provides=('octopi-notifier')
conflicts=('octopi-notifier-frameworks')
source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=(${_gitsha256})

prepare() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
}

build() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  msg "Building octopi-notifier..."
  cd notifier
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro
  make
}

package() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  cd notifier
  make INSTALL_ROOT="${pkgdir}" install
}
