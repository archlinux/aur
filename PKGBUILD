# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakc@gmail.com>

pkgname=xcorners-git
pkgver=r16.2763402
pkgrel=1
pkgdesc="A small utility for drawing rounded screen corners on X11 "
arch=(x86_64)
url="https://github.com/Spydr06/xcorners"
license=('MIT')
depends=('libx11' 'libxfixes' 'cairo')
makedepends=('gcc' 'make')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xcorners"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  	cd "$srcdir/xcorners"
	make
}

package() {
  	cd "$srcdir/xcorners"
	install -Dm755 xcorners "${pkgdir}/usr/bin/xcorners"
}
