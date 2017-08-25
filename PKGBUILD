# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.0
_pkgver=1.3.21
pkgrel=1
_fedrel=26
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("custom:AVASYSPL")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
source=("imagescan-plugin-networkscan.install")
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
md5sums=('f608c4458ec47603ce868e443d42ccd0')
md5sums_i686=('b8967230cca414df62f09945ab0d76af')
md5sums_x86_64=('6c1f1bf21d80b63e82cb84a1c9119e36')
if [[ ${CARCH} = "x86_64" ]]; then
  _pkgarch="x64"
else
  _pkgarch="x86"
fi

prepare() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  bsdtar -xf ${pkgname}-${pkgver}-1epson4fedora${_fedrel}.${CARCH}.rpm
}

package() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  install -Dm755 usr/libexec/utsushi/networkscan $pkgdir/usr/lib/utsushi/networkscan
  install -Dm644 usr/share/doc/${pkgname}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/${pkgname}/AVASYSPL
}
