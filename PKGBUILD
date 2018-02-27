pkgname=imagescan-plugin-gt-s650
pkgver=1.0.0
_pkgver=1.3.26
pkgrel=1
_fedrel=27
pkgdesc="Plugin for using Epson GT-S650 and Perfection V39 with Image Scan v3"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("custom")
depends=("imagescan")
install=imagescan-plugin-gt-s650.install
source=("imagescan-plugin-gt-s650.install")
source_i686=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x86/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
md5sums=('42eed403d883c2865850b55527fd9a22')
md5sums_i686=('ed7b6efe95c017c4209966f82706b3b3')
md5sums_x86_64=('e2be52d9e5fbc5f88601dd785d5ebc4b')
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
