_pkgname=xdg-desktop-portal-luminous
pkgname="${_pkgname}-git"
pkgver=r32.6da9b2c
pkgrel=1
url='https://github.com/waycrate/xdg-desktop-portal-luminous'
pkgdesc='xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast'
arch=('x86_64' 'aarch64')
license=('BSD-2-Clause')
depends=('xdg-desktop-portal' 'slurp')
provides=("xdg-desktop-portal-impl")
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  meson setup build \
    -Dprefix=/usr \
    -Dlibexecdir=lib \
    -Dbuildtype=release
  ninja -C build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
