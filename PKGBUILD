# Maintainer: Daniel Grasso

pkgname=wayland-scroll-factor
pkgver=1.0.3
pkgrel=1
pkgdesc='Touchpad scroll and gesture tuning for Wayland (GNOME)'
arch=('x86_64')
url='https://github.com/daniel-g-carrasco/wayland-scroll-factor'
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'pkgconf' 'gcc')
optdepends=(
  'libinput-tools: for wsf doctor diagnostics'
)
install=wayland-scroll-factor.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/daniel-g-carrasco/wayland-scroll-factor/archive/refs/tags/v$pkgver.tar.gz")
# TODO(release): replace with the real sha256 of the v1.0.0 tarball once the
# tag exists (run updpkgsums), then regenerate .SRCINFO with makepkg.
sha256sums=('574dbfd4c3bbaab05547098b5658f7c3e9652d9f2644f04d2b2ab069f9aaea55')

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
