# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=akonadi-ews
pkgver=0.8.0
pkgrel=4
pkgdesc="Resource agent for Microsoft Exchange using Exchange Web Services (EWS) protocol"
arch=('i686' 'x86_64')
url="https://github.com/KrissN/akonadi-ews/"
license=('GPL')
depends=('kcalcore' 'akonadi-mime' 'hicolor-icon-theme' 'kcontacts')
makedepends=('extra-cmake-modules' 'boost' 'kdesignerplugin')
source=("https://github.com/KrissN/akonadi-ews/archive/v${pkgver}.tar.gz"
        'ewsxml.patch'
        'qt57.patch')
sha256sums=('29424e8f02e739f0fa0fa657ef4a0d597b91bc0907c575db44d77d399590b76c'
            'da2c59c577b9de10015889d639351dbfd9c0de10246f552a863bd80cd20729d0'
            '2ec0e4223580820b46cdc6490ac5318991182bedab1357bf635ef474e955fad5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  patch -p1 < ../qt57.patch
  patch -p1 < ../ewsxml.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
