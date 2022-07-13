# Maintainer: Darrell Enns <darrell@darrellenns.com>
_pkgname=leslie
pkgname=${_pkgname}-git
pkgrel=3
pkgver=0.r8.aa2c796
pkgdesc="A leslie audio effect with jack, OSC control, and (optionally) an opengl GUI."
url="https://github.com/darrellenns/leslie"
arch=('x86_64' 'i686')
license=('GPL')
depends=('liblo' 'libgl' 'glut' 'ftgl' 'boost-libs' 'jack' 'ttf-dejavu' 'alsa-lib' 'freetype2')
makedepends=('git' 'boost' 'fontconfig')
conflicts=()
replaces=()
backup=()
source=('leslie::git+https://github.com/darrellenns/leslie.git')
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
