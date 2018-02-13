# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>

pkgname=ps3xport-git
pkgver=r70.95479d3
pkgrel=1
pkgdesc="PS3 backup extractor"
arch=('i686' 'x86_64')
url="https://github.com/kakaroto/ps3xport"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=("")
replaces=()
backup=()
options=()
install=
source=("ps3xport::git+https://github.com/kakaroto/ps3xport")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	# Git, tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/ps3xport" || exit
	./autogen.sh
	make
}

package() {
	install -D -m755 "${srcdir}/ps3xport/ps3xport" "${pkgdir}/usr/bin/ps3xport"
}
