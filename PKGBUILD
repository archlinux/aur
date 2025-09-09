pkgname=xdg-desktop-portal-shana
pkgver=0.3.16
pkgrel=1.0
pkgdesc='xdg-desktop-portal-shana'
arch=('x86_64' 'aarch64')
pkgdesc='A filechooser portal backend for any desktop environment'
url='https://github.com/Decodetalkers/xdg-desktop-portal-shana'
install=''$pkgname'.install'
license=('MIT')
depends=('xdg-desktop-portal')
provides=("xdg-desktop-portal-impl")
optdepends=("xdg-desktop-portal-gnome: provide gnome backend"
            "xdg-desktop-portal-kde: provide kde backend"
            "xdg-desktop-portal-gtk: provide gtk backend"
            "xdg-desktop-portal-lxqt: provide lxqt backend")
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/xdg-desktop-portal-shana/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('640acacdee1e6d44bb5ac64f7ad90316b116b52439f387cd1af4575d44cc83e2')

build() {
  cd ${pkgname}-$pkgver
  meson setup build \
    -Dprefix=/usr \
    -Dlibexecdir=lib \
    -Dbuildtype=release
  ninja -C build
}
package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
