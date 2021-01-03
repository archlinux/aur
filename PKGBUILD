# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=xruncounter-git
pkgver=r17.6c85db6
pkgrel=1
pkgdesc="Small tool to measure jack xruns under DSP load"
arch=('i686' 'x86_64')
url="https://github.com/Gimmeapill/xruncounter"
license=('GPL3')
depends=('jack')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/Gimmeapill/xruncounter")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	gcc -Wall xruncounter.c -lm `pkg-config --cflags --libs jack` -o xruncounter
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	install -m655 xruncounter "$pkgdir/usr/bin"
}
  

