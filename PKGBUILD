# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=noctalia-v5-git
_pkgname=noctalia-shell
pkgver=5.0.0.r1133.gfbe4867ef
pkgrel=1
pkgdesc="Noctalia Shell (v5 development branch)"
arch=('x86_64')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('GPL3')
depends=('sdbus-cpp' 'wayland' 'freetype2' 'fontconfig' 'cairo' 'pango' 'libxkbcommon' 'glib2' 'polkit' 'pipewire' 'curl' 'libwebp' 'libepoxy')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols' 'just')
provides=("noctalia-shell")
conflicts=("noctalia-shell" "noctalia-shell-git")
source=("${_pkgname}::git+https://github.com/noctalia-dev/noctalia-shell.git#branch=v5")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "5.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  just configure release
  just build release
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" just install release
}
