# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aleksandr Grehov <alewmosse@gmail.com>

_pkgname='2048term'
_patch='0001-Makefile-tweak-usage-of-implicit-variables.patch'
pkgname="${_pkgname}-git"
pkgver=20220613.bf22f86
pkgrel=3
pkgdesc='Console version of the game "2048"'
url='https://github.com/alewmoose/2048-in-terminal.git'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('glibc' 'ncurses')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/alewmoose/2048-in-terminal.git"
        "${_patch}")
sha256sums=('SKIP'
            '76a5244ecb82f4a6928a2cdbc5fae7db1e1f94fb6c270f98cd7cd1a3129b89b2')

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
