# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-rustdesk
pkgver=1.0.0.0
pkgrel=2
_builderver=1.4.31.0
pkgdesc="A protocol plugin for Remmina to launch a Rustdesk connection"
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'rustdesk')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0b4da21e250d582c9d84e279986f4b4384740a7026b052ebc295950c95b4d5cd'
            '62fbd565029778a6faad609138a8233bd3066035753d8f487618a06247e8a6dc')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
