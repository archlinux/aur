# Maintainer: Quadsam <sam@quadsam.com>
pkgname='dmenustatus-git'
pkgver=0.10.3.r0.a19dd93
pkgrel=1
pkgdesc="A statusbar for dmenu written in C."
arch=('x86_64')
url="https://github.com/Quadsam/${pkgname%-git}"
license=('AGPL-3.0-or-later')
depends=('dmenu' 'libx11' 'fontconfig' 'alsa-lib' 'glibc')
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
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
