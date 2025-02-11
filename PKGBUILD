pkgname=xdg-desktop-portal-luminous
pkgver=0.1.8
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
sha256sums=('b64e0f369c8311e031a8355b2894078040d426c4ee671c6c8c969407ced9f0aa')

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
