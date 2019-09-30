# Maintainer: nsmcclellan <email not provided>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: rosenbaum <email not provided>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.3
_pkgver=3.59.2
pkgrel=1
_fedrel=29
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("Custom License - See /usr/share/doc/${pkgname}/COPYING.EPSON.en.txt")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest2/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest2/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
sha256sums_i686=('01252297c3f164613672fdb1a60b1161ad8b1a658b7085d27852dcf1a38a554c')
sha256sums_x86_64=('65f28e9f752226f7292992384e21a8b0280144d54d3ad8a8dedf793d8d9f3f12')

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
  install -Dm644 usr/share/doc/${pkgname}/COPYING.EPSON.en.txt $pkgdir/usr/share/doc/${pkgname}/COPYING.EPSON.en.txt
  install -Dm644 usr/share/doc/${pkgname}/NEWS $pkgdir/usr/share/doc/${pkgname}/NEWS
  install -Dm644 usr/share/doc/${pkgname}/README $pkgdir/usr/share/doc/${pkgname}/README
}
