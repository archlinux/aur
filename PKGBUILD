# Maintainer: mk <mail@singular.de>

pkgname=wf-dock-plus
pkgver=0.1.0
pkgrel=1
pkgdesc='Dock for Wayfire with pinned launchers, app grouping and a places menu, based on wf-dock'
arch=(aarch64 x86_64)
url='https://github.com/mkay/wf-dock-plus'
license=(MIT)
depends=(cairomm-1.16 gcc-libs glib2 glibc glibmm-2.68 gtk4 'gtk4-layer-shell>=1.3.0'
         'gtkmm-4.0>=4.12' libsigc++-3.0 wayland 'wf-config>=0.7.0')
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6efd0565c2dc6096b4e93124fe7b9e137b6ded6636dd2eccba9b93664b038b99')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
