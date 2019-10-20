# Maintainer: dakriy <aur at persignum dot com>
pkgname=classicube-git
_pkgname=ClassiCube
pkgver=1.0.8.r70.gd7040b53
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
source=("git://github.com/UnknownShadow200/ClassiCube.git" classicube.desktop classicube)
sha256sums=('SKIP' 'f86ccd0bcba3a9aaf7e1e30c89ab316c0ba2f713715c2246ac06fe6de4feb246' 'f4a76d3790ba32e5e3859e797ad2f3c4e31ea3a3db6d01e45fd9ec5338655d5e')

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

