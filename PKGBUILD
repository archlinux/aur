# Maintainer: Nirenjan Krishnan <nirenjan@gmail.com>

pkgname=libx52
pkgver=0.3.3
pkgrel=2
pkgdesc="Application to control the MFD and LEDs of a Saitek X52/X52Pro HOTAS"
arch=('x86_64')
url="https://github.com/nirenjan/${pkgname}"
license=('GPL2')
depends=('libusb' 'hidapi' 'libevdev' 'libinih')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'python'
         'gettext' 'libusb' 'hidapi' 'libevdev' 'libinih' 'doxygen' 'cmocka' 'git')
install="${pkgname}.install"
backup=('etc/x52d/x52d.conf')
source=("https://github.com/nirenjan/libx52/releases/download/v${pkgver}/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('c4d4cdce7f2fce85871f3b1a4bf0f8122eb2969e62ee0d381984c9d26e0a8e25')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  ../configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc \
    --disable-silent-rules --disable-maintainer-mode
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make install DESTDIR="${pkgdir}"

  # Delete the /var/run and /var/log directories, they are owned by the system
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var/log"
}
