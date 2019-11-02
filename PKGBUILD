# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=ed0a6c8b822dcc546c56c3f5afe5de3e8b357471
_gitsha256='00fa0b882a828973c481d2a5f54e966df0a66e8fcd2a3aad60a3c14b4455143d'

pkgbase=octopi-notifier-qt5
pkgname=('octopi-notifier-qt5')
pkgver=0.9.0
pkgrel=7
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
