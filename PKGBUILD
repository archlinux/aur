# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_pkgtagname=v0.15.0

pkgname=octopi-notifier-frameworks
pkgver=0.15.0
pkgrel=3
pkgdesc='Notifier for Octopi with Knotifications support'
arch=('any')
url="https://tintaescura.com/projects/octopi/"
license=('GPL2')
depends=('octopi' 'knotifications5')
makedepends=('qt5-tools')
provides=('octopi-notifier')
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('e94525d906d6ab4f5fc594cf1a267668ae5f1fa7f32e449ddfa84328dd738f30')

prepare() {
	cd "${_githubrepo}-${pkgver}"
	sed -e "s|DEFINES += OCTOPI_EXTENSIONS ALPM_BACKEND #KSTATUS|DEFINES += OCTOPI_EXTENSIONS ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier.pro
}
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
