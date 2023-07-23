# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_gitcommit=455ae4853f0d343166cd0a90138465bf531029e1

pkgname=octopi-notifier-frameworks-dev
pkgver=0.14.0.r8.455ae48
pkgrel=1
pkgdesc='Notifier for Octopi with Knotifications support'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('octopi-dev')
makedepends=('git' 'qt5-tools')
provides=('octopi-notifier')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

prepare() {
  cd "${_githubrepo}"
  sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier.pro
}
build() {
  cd "${_githubrepo}"
  msg "Building octopi-notifier..."
  cd notifier
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro
  make
}

package() {
  cd "${_githubrepo}"
  cd notifier
  make INSTALL_ROOT="${pkgdir}" install
}
