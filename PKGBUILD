# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.6.6
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz")
sha256sums=('9ca938b62c4adf2fe23e4b855b55fbc61297515434d1a042155efdb4ec60a371')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
