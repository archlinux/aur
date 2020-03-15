# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=292506e02006be89f02fe6ccb10f8e3ceefbf7e8
_gitsha256='9ce5ccca003bb738f707801ad70aef9ae45de1662f7bd2c53e7ec4dc41efdc77'

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.9.0
pkgrel=22
pkgdesc="Notifier for Octopi with Knotifications support"
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=("octopi-dev" 'knotifications')
makedepends=('qt5-tools')
provides=('octopi-notifier')
conflicts=('octopi-notifier-qt5')
source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=(${_gitsha256})

prepare() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  # set Knotifications
  sed -i 's|#KSTATUS|KSTATUS|' notifier/octopi-notifier.pro
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
