pkgname=xdg-desktop-portal-luminous
pkgver=0.1.12
pkgrel=1
url='https://github.com/waycrate/xdg-desktop-portal-luminous'
pkgdesc='xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast'
arch=('x86_64' 'aarch64')
license=('GPL-3')
depends=('xdg-desktop-portal' 'slurp' 'qt5-base')
provides=("xdg-desktop-portal-impl" "xdg-desktop-portal-luminous")
conflicts=("xdg-desktop-portal-luminous-git")
makedepends=('git' 'ninja' 'meson' 'rust' 'clang' 'qt5-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/waycrate/xdg-desktop-portal-luminous/archive/refs/tags/v${pkgver}.tar.gz")
options+=(!lto)
sha256sums=('5a325275d123458c3ff3d9548225c2b9067a751c32b308e356e55d1a29387b45')

build() {
  cd "${pkgname}-$pkgver"
  meson setup build \
    -Dprefix=/usr \
    -Dlibexecdir=lib \
    -Dbuildtype=release
  meson compile -C build
}

package() {
  cd "${pkgname}-$pkgver"
  DESTDIR="${pkgdir}" ninja -C build install
}
