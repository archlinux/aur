# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aleksandr Grehov <alewmosse@gmail.com>

_pkgname='2048term'
_patch='0001-ARCHLINUX-conform-Makefile-to-packaging-standards.patch'
pkgname="${_pkgname}-git"
pkgver=20220613.bf22f86
pkgrel=2
pkgdesc='Console version of the game "2048"'
url='https://github.com/alewmoose/2048-in-terminal.git'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('glibc' 'ncurses')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/alewmoose/2048-in-terminal.git"
        "${_patch}")
sha256sums=('SKIP'
            '913a3c2a535fa514cfa764ed77e1cf52742bdf1810aa71a2fc34585640e1daa5')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch --forward --strip=1 --input="${srcdir}/${_patch}"
}

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
