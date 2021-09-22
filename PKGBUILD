# Maintainer: Nirenjan Krishnan <nirenjan@gmail.com>

pkgname=libx52
_gitname=x52pro-linux
pkgver=0.2.3
pkgrel=1
pkgdesc="Application to control the MFD and LEDs of a Saitek X52/X52Pro HOTAS"
arch=('x86_64')
url="https://github.com/nirenjan/${_gitname}"
license=('GPL2')
depends=('libusb' 'hidapi' 'libevdev')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'python'
         'gettext' 'libusb' 'hidapi' 'libevdev' 'doxygen' 'rsync' 'cmocka' 'git')
install="${pkgname}.install"
source=("https://github.com/nirenjan/x52pro-linux/releases/download/v${pkgver}/${_gitname}_${pkgver}.orig.tar.gz")
sha256sums=('2ef00c521413a7f87581356e502ffe04196e22e951374a49b6eabb03cb76a9d4')

build() {
  cd ${srcdir}/${_gitname}-${pkgver}
  mkdir build
  cd build
  ../configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc \
    --disable-silent-rules --disable-maintainer-mode
  make
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}/build

  make install DESTDIR="${pkgdir}"

  # Delete the /var/run and /var/log directories, they are owned by the system
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var/log"
}
