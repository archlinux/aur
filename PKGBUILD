# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.2.0
pkgrel=0
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libdrm libxkbcommon aml pixman neatvnc)
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('360cad38e5454a632120ba32fccee794a82b2cdbaad46a3455ae1b9a9d1e17dda314eb8c78b1e2ccfe8b2e6df2f5d38a440c4fea4e33e0267b1316e58ce61da9')

build() {
  cd $pkgname-$pkgver
  arch-meson build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
