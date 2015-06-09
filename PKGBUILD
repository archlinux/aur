# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Moritz Lüdecke <ritze at skweez dot net>
# Contributor: boenki <boenki at gmx dot de>

pkgname="cover-thumbnailer"
pkgver="0.8.3"
pkgrel="4"
pkgdesc="A Python script which displays music album covers in nautilus, preview of pictures which are in a folder and more."
arch=('i686' 'x86_64')
url="https://launchpad.net/cover-thumbnailer"
license=('GPL3')
depends=('python2-pillow' 'python2-gconf')
makedepends=('gettext')
provides=("${pkgname}")
source=("https://launchpad.net/${pkgname}/v0.8/v${pkgver}/+download/${pkgname}_${pkgver}_src.tar.gz")
sha256sums=('c0d5213743cb251428b9998d7838d6d6e64bb4bb9ccd3a21ffebb3fc21b688c4')

install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"

    ### Python2 Fix ###
	sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|g" ${pkgname}{,-gui}.py

    ### Python2-pillow (PIL) Fix ###
    sed -i "/import Image/i\from PIL import Image" ${pkgname}.py
	sed -i "s|import Image, urllib|import urllib|g" ${pkgname}.py
	sed -i "s|!=|is not|g" ${pkgname}.py

    ### Thumbnailers cache Fix (Gnome 3.12) ###
	sed -i "s|.thumbnails|.cache/thumbnails|g" ${pkgname}-gui.py
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"
	./install.sh -p ${pkgdir}
}

# vim:set ts=4 sw=2 ft=sh et:
