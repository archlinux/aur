_pkgname=xdg-desktop-portal-luminous
pkgname="${_pkgname}-git"
pkgver=r78.7118cbe
pkgrel=1
url='https://github.com/waycrate/xdg-desktop-portal-luminous'
pkgdesc='xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast'
arch=('x86_64' 'aarch64')
license=('BSD-2-Clause')
depends=('xdg-desktop-portal' 'slurp' 'qt5-base')
provides=("xdg-desktop-portal-impl")
makedepends=('git' 'ninja' 'meson' 'rust' 'clang' 'qt5-base')
source=("${_pkgname}::git+${url}.git")
options+=(!lto)
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  meson setup build \
    -Dprefix=/usr \
    -Dlibexecdir=lib \
    -Dbuildtype=release
  meson compile -C build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
