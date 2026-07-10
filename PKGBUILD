# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# SPDX-License-Identifier: 0BSD
pkgname=swaylock-plugin
pkgver=1.8.7
pkgrel=1
pkgdesc='A fork of the swaylock screen locker for Wayland supporting custom wallpaper drawing programs'
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
depends=(
  'glibc' 'wayland' 'cairo' 'pam' 'libxkbcommon' 'systemd-libs' 'glib2'
  'gdk-pixbuf2' 'swaybg'
)
optdepends=(
  'mpvpaper: to implement video backgrounds'
  'windowtolayer: to use a terminal as background'
)
backup=(etc/pam.d/swaylock-plugin)
url="https://github.com/mstoeckl/swaylock-plugin"
source=("https://github.com/mstoeckl/swaylock-plugin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("98ac74457adfeb812f91e2fc4b289db664637b0d3890a051347b8d1169cc3757")
build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}
package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

