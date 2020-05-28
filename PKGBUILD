# Maintainer: nsmcclellan <email not provided>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: rosenbaum <email not provided>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.3
_pkgver=3.62.0
pkgrel=2
_fedrel=30
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("i686" "x86_64")
url="http://support.epson.net/linux/en/imagescanv3.php"
license=("Custom License - See /usr/share/doc/${pkgname}/COPYING.EPSON.en.txt")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest2/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest2/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
sha256sums_i686=('0788f35984fa702d0730d19c515ac303715a5dc546d9f72c39557f826d12297c')
sha256sums_x86_64=('2ec3be6769ae83f2ca3f317ceaec219f089c374d454e0753f87e329a778905bf')

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
