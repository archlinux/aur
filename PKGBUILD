# Maintainer: Alex Wiggins <alex . d . wiggins at gmail . com>
# Maintainer: bslackr <brendan at vastactive dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=iscan-plugin-network
_pkgintname=iscan-data
_pkgdlname=iscan-bundle
pkgver=1.36.0
_pkgver=1.36.0-1 # workaround for hyphen in version
_pkgdlver=1.0.0 # download bundle version
pkgrel=12
pkgdesc="Plugin for using Epson scanners with ISCAN over network"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=(iscan)
conflicts=(iscan-data)
install=iscan-plugin-network.install
if [[ ${CARCH} = 'x86_64' ]]; then
    _pkgarch='x64'
    sha512sums=('081ea48a83f955abd8f8d081f322e87ca02c91d371d6a7ed2d7cc4075c590c162a4ee9cd196cf5a53e6ce26fe29e34ef5a42400c06d336d2b8ccd33a6853575a')
    source=("iscan-bundle.deb.tar.gz::https://download2.ebz.epson.net/iscan/general/deb/${_pkgarch}/${_pkgdlname}-${_pkgdlver}.${_pkgarch}.deb.tar.gz")
else
    _pkgarch='x86'
    sha512sums=('d91a064342640582a71c664441e944812bc2fd18bd8f00010838adac7ad0581efcf8c9224c48a136ae0aec7f26b6df8071da7c2e10110eafe91c1dbd7f9865ad')
    source=("iscan-bundle.deb.tar.gz::https://download2.ebz.epson.net/iscan/general/deb/${_pkgarch}/${_pkgdlname}-${_pkgdlver}.${_pkgarch}.deb.tar.gz")
fi

build() {
cd $srcdir
cd ${_pkgdlname}-${_pkgdlver}.${_pkgarch}.deb/data
bsdtar -xf ${_pkgintname}_${_pkgver}_all.deb
bsdtar -xf data.tar.gz
cp -R usr $srcdir
}

package() {
cd $srcdir
cp -R usr $pkgdir
install -Dm644 usr/share/doc/${_pkgintname}/copyright $pkgdir/usr/share/licenses/${pkgname}/AVASYSPL
} 