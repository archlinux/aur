# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aleksandr Grehov <alewmosse@gmail.com>

_pkgname='2048term'
pkgname="${_pkgname}-git"
pkgver=20220613.bf22f86
pkgrel=1
pkgdesc='Console version of the game "2048"'
url='https://github.com/alewmoose/2048-in-terminal.git'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/alewmoose/2048-in-terminal.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 _build/2048-in-terminal "${pkgdir}/usr/bin/2048t"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}-git/LICENSE"
}
