# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname='jftui'
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI client for Jellyfin based on mpv"
arch=('x86_64')
url="https://github.com/Aanok/jftui"
license=('Unlicense')
makedepends=('gcc' 'pkgconf' 'make')
depends=('mpv' 'yajl' 'curl')
provides=("${pkgname}")
conflicts=('jftui-git')
source=("https://github.com/Aanok/jftui/archive/v${pkgver}.tar.gz")
sha256sums=('5a6370caa3ca35416cb24bc39d1021e58fa7cf9e0dbbafe115d1d4a369da707b')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/clang/gcc/' Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
