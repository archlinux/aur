# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.4.5
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=('x86_64')
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz")
sha256sums=('2ed6a3519e48b82625ae212039bc1c4f8c8f55c975761b197670237dd9b1f480')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
