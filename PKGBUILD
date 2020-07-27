# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=powerkit
pkgver=1.0.0
pkgrel=8
pkgdesc='A Lightweight Desktop Independent full featured power manager'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/rodlie/powerkit'
license=('BSD')
install='powerkit.install'
depends=('xscreensaver'
         'upower'
         'qt5-base'
         'libxss')
makedepends=('xorg-xrandr' 'qt5-base')
optdepends=('adwaita-icon-theme')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('fd7d0f88945cd6e1423dbcab4416bb327261845cab7d896b6ddab0c0a015e500')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  qmake PREFIX=/usr CONFIG+=install_udev_rules CONFIG+=bundle_icons ..
  make 
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: