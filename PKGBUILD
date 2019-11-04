# Maintainer: Alex Wiggins <alex . d . wiggins at gmail . com>
# Maintainer: bslackr <brendan at vastactive dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=iscan-plugin-network
_pkgintname=iscan-network-nt
_pkgdlname=iscan-bundle
pkgver=1.1.2
_pkgver=1.1.2-1 # workaround for hyphen in version
_pkgdlver=2.30.4 # download bundle version
pkgrel=14
pkgdesc="Plugin for using Epson scanners with ISCAN over network"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:COPYING.EPSON')
depends=(iscan)
makedepends=(gzip)
install=iscan-plugin-network.install
if [[ ${CARCH} = 'x86_64' ]]; then
    _pkgdlarch='x64'
    _pkgarch='amd64'
    sha512sums=('6d967f5d2d554478df49c784d0ee785a9e1fc4f4b6ea4dc320270a50eca35cc3d533b918a1bda33cf3b0e9b783380e7828b77543730079b2e2f40ad9578db79d')
    source=("iscan-bundle.deb.tar.gz::https://download2.ebz.epson.net/iscan/general/deb/${_pkgdlarch}/${_pkgdlname}-${_pkgdlver}.${_pkgdlarch}.deb.tar.gz")
else
    _pkgdlarch='x86'
    _pkgarch='i386'
    sha512sums=('6d967f5d2d554478df49c784d0ee785a9e1fc4f4b6ea4dc320270a50eca35cc3d533b918a1bda33cf3b0e9b783380e7828b77543730079b2e2f40ad9578db79d')
    source=("iscan-bundle.deb.tar.gz::https://download2.ebz.epson.net/iscan/general/deb/${_pkgdlarch}/${_pkgdlname}-${_pkgdlver}.${_pkgdlarch}.deb.tar.gz")
fi

build() {
cd $srcdir
cd ${_pkgdlname}-${_pkgdlver}.${_pkgdlarch}.deb/plugins
bsdtar -xf ${_pkgintname}_${_pkgver}_${_pkgarch}.deb
bsdtar -xf data.tar.gz
cp -R usr $srcdir
}

package() {
cd $srcdir
cp -R usr $pkgdir
gunzip usr/share/doc/${_pkgintname}/COPYING.EPSON.en.txt.gz
install -Dm644 usr/share/doc/${_pkgintname}/COPYING.EPSON.en.txt $pkgdir/usr/share/licenses/${pkgname}/COPYING.EPSON
} 
