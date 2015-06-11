# Maintainer : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)

pkgname=mintlocale
pkgver=1.2.2
pkgrel=1
pkgdesc="Locale selection for the Cinnamon Desktop"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject')
source=("http://packages.linuxmint.com/pool/main/m/mintlocale/mintlocale_$pkgver.tar.gz"
	"apt_pkg.patch")

sha256sums=('92050d3138954e2114aac4e75c1f927b40d52123ade4fdfbb3a8d6d25aaf37ec'
            'd18b6ae1a699b5a31436bbaf2a18d96d64a54e33a6d5daa1c60dfb0250f2dbc2')


prepare() {
	cd "$srcdir/$pkgname"
	find -type f -print0 | xargs -0 sed -i 's@^#!.*python$@#!/usr/bin/python2@'
	patch -p1 -i ../apt_pkg.patch
}

package() {
	cd "$srcdir/$pkgname"
	cp -r --no-preserve=owner usr $pkgdir
}
