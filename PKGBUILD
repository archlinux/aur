# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=imageburner
pkgver=1.0.2
pkgrel=1
pkgdesc="Image burner for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="https://artemanufrij.github.io/"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/imageburner/archive/${pkgver}.tar.gz")
sha256sums=('cba3c9817c02b34fef949be0076190ee48d43fa96ef316a89d7f931653dd86b1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.artemanufrij.imageburner "$pkgdir/usr/bin/imageburner"
}
