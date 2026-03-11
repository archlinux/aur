# Maintainer: Quadsam <sam@quadsam.com>
pkgname='dmenustatus-git'
pkgver=0.11.0.r0.33d41a7
pkgrel=1
pkgdesc="A statusbar for dmenu written in C."
arch=('x86_64')
url="https://github.com/Quadsam/${pkgname%-git}"
license=('AGPL-3.0-or-later')
depends=('dmenu' 'libx11' 'alsa-lib' 'lm_sensors' 'glibc')
optdepends=('dwm')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
options=('!debug')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make MODE="release"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir" MODE="release" install
}
