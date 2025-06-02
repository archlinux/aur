# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-rustdesk
pkgver=1.0.0.0
pkgrel=3
_builderver=1.4.40.0
pkgdesc="A protocol plugin for Remmina to launch a Rustdesk connection"
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL-2.0-or-later')
depends=('gtk3' 'remmina' 'rustdesk')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2b5c5c662d1f506bfa425ec0ce4defdacca60a94ea784b6fd01ff925823afee7'
            '62fbd565029778a6faad609138a8233bd3066035753d8f487618a06247e8a6dc')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF -DCMAKE_BUILD_TYPE=Release .
  cmake --build .
}

package() {
  cd "${srcdir}/build/"
  DESTDIR="${pkgdir}" cmake --install .
}
