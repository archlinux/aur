# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.7.6
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz")
sha256sums=('dde7f00a3a032d30e7566bd97250550d71dd825609be07a63384c5c00038f0ce')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false -D patched-vte=true
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.muriloventuroso.easyssh "${pkgdir}/usr/bin/easyssh"
}
