# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor
pkgver=1.3.0
pkgrel=1
pkgdesc="Plasma applet for monitoring temperatures of existing sensors including CPU, GPU and HDD."
arch=(any)
url="https://gitlab.com/agurenko/plasma-applet-thermal-monitor/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=(${url}/-/archive/${pkgver}/${pkgname/5-applets/-applet}-${pkgver}.tar.bz2
        ${pkgname}-fix-window-size.patch::${url}/-/commit/c780ccea2bf8c6050a4ecdacc006ed0f73edb9bb.patch
        ${pkgname}-whitespace-clean.patch::${url}/-/commit/d30197f2b07901bfcfc4c1e6d26e14f2c242bdf6.patch
        ${pkgname}-fix-config-window-crash.patch::${url}/-/commit/a2493ee35417ffe707816872d865ce92d74a9a15.patch)
sha256sums=('3e7e218f59285bba3c8a23810cf39a3a938f3ff152cd3a2ad1adb5e8ec034ad9'
            '6a4d818ec56e472a77b83e7d6ee477cdc667d531628d5e108a77b1fbb29e4575'
            'e3cc2d0b39194baf12ebbcb8650d4b81ca077ff66aef4fd22177433715e4d993'
            'c914afed4f101d231edf350e45cb9196fe4d2bcce56898a02f1007fcc1141541')

prepare() {
  cd plasma-applet-thermal-monitor-${pkgver}
  patch -p1 -i ../${pkgname}-fix-window-size.patch
  patch -p1 -i ../${pkgname}-whitespace-clean.patch
  patch -p1 -i ../${pkgname}-fix-config-window-crash.patch
}

build() {
  cmake -B build -S plasma-applet-thermal-monitor-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
