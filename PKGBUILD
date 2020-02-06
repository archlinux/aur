pkgname=nocomprendo
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice command application for X.org"
arch=('x86_64')
url="http://be.root.free.fr/?soft=nocomprendo"
license=('GPL3')
depends=('qt5-base' 'espeak' 'xdotool' 'pocketsphinx')
source=("http://be.root.free.fr/soft/nocomprendo/nocomprendo-${pkgver}.tar.gz" unbundle_pocketsphinx.patch)
sha256sums=('eb9469db940aaa8aae9b37b81035233687499fdc2fbc5b55dfb7a37b0e9a1d60' SKIP)

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/unbundle_pocketsphinx.patch
}

build() {
  cd ${pkgname}-${pkgver}
  qmake
  make
}

package() {
  cd ${pkgname}-${pkgver}/
  make INSTALL_ROOT="${pkgdir}" install
}
