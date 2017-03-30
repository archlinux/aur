# Maintainer: Leonardo Vieira <leosanvieira at gmail dot com>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.0
_pkgver=1.3.18
pkgrel=1
_fedrel=25
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("custom:AVASYSPL")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
if [[ ${CARCH} = "x86_64" ]]; then
    _pkgarch="x64"
    _arch="x86_64"
    md5sums=('b9d11620b33125746b14e1aa6d6b0077'
             'f608c4458ec47603ce868e443d42ccd0')
    source=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/${_pkgarch}/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm.tar.gz"
            "imagescan-plugin-networkscan.install")
else
    _pkgarch="x86"
    _arch="i686"
    md5sums=('08899d5746320ef460544321e6b51288'
             'f608c4458ec47603ce868e443d42ccd0')
    source=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/${_pkgarch}/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm.tar.gz"
            "imagescan-plugin-networkscan.install")
fi

prepare() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  bsdtar -xf ${pkgname}-${pkgver}-1epson4fedora${_fedrel}.${_arch}.rpm
}

package() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  install -Dm755 usr/libexec/utsushi/networkscan $pkgdir/usr/lib/utsushi/networkscan
  install -Dm644 usr/share/doc/${pkgname}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/${pkgname}/AVASYSPL
}
