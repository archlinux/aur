# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname='jftui'
pkgver=0.3.0
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
sha256sums=('336cc17a67bb91ee0b1ca0a5a3d2e415054806cb80f9b1c9b382eb4fdcde3bb5')

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
