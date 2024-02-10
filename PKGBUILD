# Maintainer: coding-agent <mcmrcs@pm.me>

_pkgname=wallpickr

pkgname="${_pkgname}-git"
pkgver=r14.e810654
pkgrel=1
pkgdesc="A very simple wallpaper picker for hyprpaper"
url="https://github.com/coding-agent/wallpickr"
license=('GPL-3.0-only')
depends=('gtk4' 'hyprland' 'hyprpaper')
makedepends=('git')
arch=('x86_64')
provides=('wallpickr')
conflicts=('wallpickr')
source=(
  "git+https://github.com/coding-agent/wallpickr"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${srcdir}/${_pkgname}"
  zig build -Doptimize=ReleaseFast
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m755 zig-out/bin/wallpickr "${pkgdir}/usr/bin/wallpickr"
}
