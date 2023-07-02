# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkg="Health"
pkgname="gnome-health"
pkgver=0.94.0
_bcver="0.8.1+93f2a27e"
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/${_pkg}"
license=(GPL3)
depends=(
  'libadwaita'
  'rust'
)
makedepends=(
  "blueprint-compiler-health=${_bcver}"
  'meson')
source=(
  "${url}/-/archive/${pkgver}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '2cf4314de185c2ad8c42cd51385e7b9ab895932a429e6afb2ece29f24da951b49cb5e8ef184c377cc48a1e6bf6f997c0cd539623a4c5603e91dff70219c4bcab'
)

prepare() {
  cd "${_pkg}-${pkgver}"
  sed -i "/max-value: 4.0;/d" "data/ui/password_entry.blp"
}

build() {
  arch-meson "${_pkg}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
