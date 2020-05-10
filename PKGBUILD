# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=hashit
pkgver=1.1.0
pkgrel=1
pkgdesc="Checksum tool for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="https://artemanufrij.github.io/"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/hashit/archive/${pkgver}.tar.gz")
sha256sums=('0fc1d6a015f036b687443b20245d5d4efc67f82812469e9a26f14bff728a50bc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.artemanufrij.hashit "$pkgdir/usr/bin/hashit"
}
