# Maintainer : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.3.4
pkgrel=1
pkgdesc="Locale selection for the Cinnamon Desktop"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject')
source=("http://packages.linuxmint.com/pool/main/m/mintlocale/mintlocale_$pkgver.tar.xz"
	"apt_pkg.patch")

sha256sums=('f836e18eb0d4e3e62a9d0657d538b02236ee6b852bc29528f549c4a9db41780a'
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
