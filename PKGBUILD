# Maintainer: codestation <codestation404@gmail.com>

pkgname=libvitamtp
_pkgname=vitamtp
pkgver=2.5.9
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
sha256sums=('b03a77689fae8b6e78de4a3d2a7cbca707f7e519219dcb6da7295ddc29ff2f02' 'ed499fabb566b06af81f784b87ea2021b74d3945920ab70e8cbdb1b3a88bb9db')
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
