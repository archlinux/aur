pkgname=xdg-desktop-portal-luminous
pkgver=0.1.7
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
sha256sums=('ab9cfd58ed25a7b20d927289214c219e45679830ff852fea14111e90c3d26d09')

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
