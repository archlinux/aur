# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-ultravnc
pkgver=1.3.0.0
pkgrel=1
_builderver=1.3.0.0
pkgdesc="A protocol plugin for Remmina to connect via VNC using UltraVNC viewer."
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'ultravnc-viewer')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0e4e2d6a79dc569444016a5479b437016386985d96a958da7505c15b1695f98c'
            '317de241e29610b9cb5abe6910ceff407b595559dc736ce23a18f6ca8866df8a')

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
