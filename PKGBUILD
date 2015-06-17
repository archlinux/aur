# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Frédérik Paradis <fredy14[at]gmail[dot]com>

pkgname=libforensic1394
pkgver=0.2
pkgrel=1
pkgdesc="An open source library for performing live memory forensics over the IEEE 1394 (“FireWire”) interface."
url="https://freddie.witherden.org/tools/libforensic1394/"
arch=('x86_64' 'i686')
license=('LGPL3')
depends=('python')
optdepends=()
makedepends=('cmake' 'gcc')
provides=('libforensic1394')
conflicts=('libforensic1394-git')
replaces=()
backup=()
source=("http://freddie.witherden.org/tools/libforensic1394/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('184434037388f6f1d7a028c81d3c9101b20200b2444e28d5e007c34204ba58e71fb0db8cb1406063f0d4fe06bca80a1795e5a44d7eae52fa1c227f0b0cbf5dbd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cmake -DCMAKE_INSTALL_PREFIX="/usr" CMakeLists.txt
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  cd python
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
