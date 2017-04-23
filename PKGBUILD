# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.3.7
pkgrel=1
pkgdesc="Locale selection for the Cinnamon Desktop"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject')
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz"
	'apt_pkg.patch')

sha256sums=('128a617c9614458de32415ff199b61ca9728207bc4b9d1ed48ebde1e8d81b798'
            'b065dc500075a5648a4aa15c98b701af7816d3d0ee2822330635b5fe6740d116')

prepare() {
	cd "${srcdir}/${pkgname}"
	find -type f -print0 | xargs -0 sed -i 's@^#!.*python$@#!/usr/bin/python2@'
	patch -p1 -i '../apt_pkg.patch'
}

package() {
	cd "${srcdir}/${pkgname}"
	cp -r --no-preserve=owner './usr' "${pkgdir}/"
}
