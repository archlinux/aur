# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=akonadi-ews
pkgver=0.8.1
pkgrel=1
pkgdesc="Resource agent for Microsoft Exchange using Exchange Web Services (EWS) protocol"
arch=('i686' 'x86_64')
url="https://github.com/KrissN/akonadi-ews/"
license=('GPL')
depends=('kcalcore' 'akonadi-mime' 'hicolor-icon-theme' 'kcontacts')
makedepends=('extra-cmake-modules' 'boost' 'kdesignerplugin' 'kdoctools')
source=("https://github.com/KrissN/akonadi-ews/archive/v${pkgver}.tar.gz"
'ewsxml.patch')
sha256sums=('855a6b2ae38e75fa9d9f9400ec91fb74f093940648ae61a0b6a9f2d66eee3caa'
            'da2c59c577b9de10015889d639351dbfd9c0de10246f552a863bd80cd20729d0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
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
