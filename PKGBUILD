# Maintainer: mk <mail@singular.de>

pkgname=wf-dock-plus
pkgver=0.2.0
pkgrel=1
pkgdesc='Dock for Wayfire with pinned launchers, app grouping, a places menu and a trash, based on wf-dock'
arch=(aarch64 x86_64)
url='https://github.com/mkay/wf-dock-plus'
license=(MIT)
depends=(cairomm-1.16 gcc-libs glib2 glibc glibmm-2.68 gtk4 'gtk4-layer-shell>=1.3.0'
         'gtkmm-4.0>=4.12' libsigc++-3.0 wayland 'wf-config>=0.7.0')
makedepends=(meson)
optdepends=('gvfs: trash button')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a243a12c65d1a555c30fc6eeada49c4a8e78d7ebfdecce8b9ef43546eaa95a5d')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
