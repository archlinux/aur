# Maintainer : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.3.3
pkgrel=1
pkgdesc="Locale selection for the Cinnamon Desktop"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject')
source=("http://packages.linuxmint.com/pool/main/m/mintlocale/mintlocale_$pkgver.tar.xz"
	"apt_pkg.patch")

sha256sums=('e188e695b53667f0be746d6ab58ea24fa31771090e6ec77c64365591aa1703fd'
            'b065dc500075a5648a4aa15c98b701af7816d3d0ee2822330635b5fe6740d116')


prepare() {
	cd "$srcdir/$pkgname"
	find -type f -print0 | xargs -0 sed -i 's@^#!.*python$@#!/usr/bin/python2@'
	patch -p1 -i ../apt_pkg.patch
}

package() {
	cd "$srcdir/$pkgname"
	cp -r --no-preserve=owner usr $pkgdir
}
