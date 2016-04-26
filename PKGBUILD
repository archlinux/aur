# Maintainer: codestation <codestation404@gmail.com>

pkgname=libvitamtp
_pkgname=vitamtp
pkgver=2.5.8
pkgrel=1
_soname=5
pkgdesc="Library to interact with Vita's USB MTP protocol"
arch=("i686" "x86_64")
url="https://github.com/codestation/vitamtp"
license=('GPL')
depends=('libusb' 'libxml2')
conflicts=('vitamtp' 'vitamtpmod')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz" "libvitamtp.install")
options=('!libtool')
sha256sums=('59f78e04685e02df3b902083bd1aaf7b0efb4f17ffa919829af401d23e01f4f4' 'ed499fabb566b06af81f784b87ea2021b74d3945920ab70e8cbdb1b3a88bb9db')
install=$pkgname.install

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/libvitamtp${_soname}.udev "$pkgdir/usr/lib/udev/rules.d/60-psvita.rules"
}
