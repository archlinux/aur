pkgname=imagescan-plugin-gt-s650
pkgver=1.0.0
_pkgver=1.3.32
pkgrel=2
_fedrel=28
pkgdesc="Plugin for using Epson GT-S650 and Perfection V39 with Image Scan v3"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("custom")
depends=("imagescan")
install=imagescan-plugin-gt-s650.install
source=("imagescan-plugin-gt-s650.install")
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
md5sums=('f608c4458ec47603ce868e443d42ccd0')
md5sums_i686=('72666226f02db5fa80530849c1bb3e8d')
md5sums_x86_64=('9ce4c83ffb8f8d4a7e88b9cf661e2138')
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
  ls -la
  install -Dm755 usr/lib64/utsushi/libcnx-esci-gt-s650.so.0.0.0 $pkgdir/usr/lib/utsushi/libcnx-esci-gt-s650.so.0.0.0
  install -Dm644 usr/share/doc/imagescan-plugin-gt-s650/COPYING.EPSON $pkgdir/usr/share/doc/imagescan-plugin-gt-s650/COPYING.EPSON
  install -Dm644 usr/share/doc/imagescan-plugin-gt-s650/NEWS $pkgdir/usr/share/doc/imagescan-plugin-gt-s650/NEWS
  install -Dm644 usr/share/doc/imagescan-plugin-gt-s650/README $pkgdir/usr/share/doc/imagescan-plugin-gt-s650/README
  install -Dm644 usr/share/utsushi/esfw010c.bin $pkgdir/usr/share/utsushi/esfw010c.bin
  cd $pkgdir/usr/lib/utsushi/
  ln -s libcnx-esci-gt-s650.so.0.0.0 libcnx-esci-gt-s650.so
  ln -s libcnx-esci-gt-s650.so.0.0.0 libcnx-esci-gt-s650.so.0
  ln -s esci-interpreter esci-gt-s650
}
