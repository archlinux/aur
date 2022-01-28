# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.7.9
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz")
sha256sums=('bf3145c141362997c643a9f9a22168292cee7a0a329ed018e826a65e1e8d087c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr -D ubuntu-bionic-patched-vte=false -D patched-vte=true
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.muriloventuroso.easyssh "${pkgdir}/usr/bin/easyssh"
}
