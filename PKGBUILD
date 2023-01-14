# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_pkgtagname=v0.14.0

pkgname=octopi-notifier-qt5
pkgver=0.14.0
pkgrel=2
pkgdesc='Notifier for Octopi using Qt5 libs'
arch=('any')
url="https://tintaescura.com/projects/octopi/"
license=('GPL2')
depends=('octopi' 'knotifications')
makedepends=('qt5-tools')
optdepends=('xfce4-notifyd: for notifications in XFCE')
provides=('octopi-notifier')
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('9b548661807fe8eecc20726a4aefa25658c4ce1bf1bc8f51b54829809d76f12d')

build() {
	cd "${_githubrepo}-${pkgver}"
	msg "Building octopi-notifier..."
	cd notifier
	qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro
	make
}

package() {
	cd "${_githubrepo}-${pkgver}"
	cd notifier
	make INSTALL_ROOT="${pkgdir}" install
}
