# Maintainer: dakriy <aur at persignum dot com>
pkgname=classicube-git
_pkgname=ClassiCube
pkgver=1.3.2.r85.g5a6f356a2
pkgrel=1
epoch=0
pkgdesc="A game based on the original Minecraft Classic. (Not an official package)"
arch=('x86_64')
url="https://www.classicube.net/"
license=('custom')
depends=('openal' 'mesa' 'curl')
makedepends=('git')
provides=('classicube')
conflicts=('classicube')
source=("git+https://github.com/UnknownShadow200/ClassiCube.git" classicube.desktop classicube)
sha256sums=('SKIP' 'f86ccd0bcba3a9aaf7e1e30c89ab316c0ba2f713715c2246ac06fe6de4feb246' 'dfe029a6fc601e671fb25e811102260bfcab6b31fa3fdd6a53760ea12023d356')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname/src"
	make
}

package() {
	install -D -m755 "$srcdir/$_pkgname/src/ClassiCube" "$pkgdir/usr/bin/classicube_run"
	install -D -m755 "$srcdir/classicube" "$pkgdir/usr/bin/classicube"
	install -D -m644 "$srcdir/$_pkgname/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
	install -D -m644 "$srcdir/$_pkgname/misc/CCicon.png" "$pkgdir/usr/share/$pkgname/CCicon.png"
	install -D -m644 "$srcdir/classicube.desktop" "$pkgdir/usr/share/applications/classicube.desktop"
}

