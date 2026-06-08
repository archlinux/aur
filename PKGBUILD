pkgname=xdg-desktop-portal-luminous
pkgver=0.1.20
pkgrel=2
url='https://github.com/waycrate/xdg-desktop-portal-luminous'
pkgdesc='xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast'
arch=('x86_64' 'aarch64')
license=('GPL-3')
depends=('xdg-desktop-portal' 'libxkbcommon')
provides=("xdg-desktop-portal-impl" "xdg-desktop-portal-luminous")
conflicts=("xdg-desktop-portal-luminous-git")
makedepends=('git' 'ninja' 'meson' 'rust' 'clang')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/waycrate/xdg-desktop-portal-luminous/archive/refs/tags/v${pkgver}.tar.gz")
options+=(!lto)
sha256sums=('6e048d02cb543add8801fad8bd902db523172b0606e5a7351ddab2b99e953332')

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
