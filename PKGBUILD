# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_gitcommit=1fa610f19468d03d51313e07088f25b4e03b9108

pkgname=octopi-notifier-frameworks-dev
pkgver=0.14.0.r12.1fa610f
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
