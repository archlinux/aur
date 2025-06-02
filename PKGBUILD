# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-rdesktop
pkgver=1.3.0.0
pkgrel=6
_builderver=1.4.40.0
pkgdesc="A protocol plugin for Remmina to open a RDP connection with rdesktop"
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL-2.0-or-later')
depends=('gtk3' 'remmina' 'rdesktop')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2b5c5c662d1f506bfa425ec0ce4defdacca60a94ea784b6fd01ff925823afee7'
            'e37ac667f6ec2eea0fc968875562a7f56addc3284ed1ecb14bca517cbad92e3d')

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
