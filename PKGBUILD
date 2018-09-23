# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.3.4
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=('x86_64')
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz"
        0001-fix-vte-build-error.patch)
sha256sums=('d59eaa43d8c633db69dd75f44ee5c5b19c8df0144adb9c87187fbaf734a76548'
            '1be1e1f1d654eafb31972320f1c94a17b7f35c4e938ceba8b6da122ab459cb48')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ../0001-fix-vte-build-error.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr -D libunity=false
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
