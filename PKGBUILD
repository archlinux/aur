# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.2
_pkgver=1.3.44
pkgrel=1
_fedrel=29
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("custom:AVASYSPL")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
sha256sums_i686=('00aa13b2ec069dfc190d0618c78649fa3ece5cc7fc43c1a8df96ca399f955027')
sha256sums_x86_64=('104d09ebcdf3f9ac8d9573b803ebfecfc001955f13a3b8b18ffe4b3382fe23cb')
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
