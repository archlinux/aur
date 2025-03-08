# Maintainer: Frank Krick frank.krick@gmail.com
pkgname=wlavu-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Wayland-based PipeWire VU-meter"
arch=('x86_64')
url=https://git.sr.ht/~kennylevinsen/wlavu
depends=('pipewire' 'wayland-protocols' 'wayland')
source=('git+https://git.sr.ht/~kennylevinsen/wlavu')
md5sums=('SKIP')
license=('MIT')

prepare() {
  mkdir tmp
  cd tmp
  git clone ../wlavu
}

build() {
  cd tmp/wlavu
  meson setup build --prefix /usr --optimization 3 --buildtype release
  cd build
  meson compile
}

package() {
  cd tmp/wlavu/build
  meson install --destdir "$pkgdir"
}
