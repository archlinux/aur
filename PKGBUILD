# Maintainer: uwuclxdy
pkgname=coopmat-layer-git
pkgver=r23.fba7d1f
pkgrel=1
pkgdesc="Vulkan cooperative matrix emulation layer"
arch=('x86_64' 'aarch64')
url="https://github.com/doitsujin/coopmat-layer"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git' 'meson' 'vulkan-headers')
provides=('coopmat-layer')
source=("git+https://github.com/doitsujin/coopmat-layer.git")
install=coopmat-layer-git.install
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/coopmat-layer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/coopmat-layer"
  git submodule update --init
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/coopmat-layer"
  DESTDIR="${pkgdir}" meson install -C build
}
