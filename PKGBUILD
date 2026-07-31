# Maintainer: Daniel Grasso

pkgname=wayland-scroll-factor
pkgver=1.0.0
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
sha256sums=('ded61c7351491aac92f9ecc55e7fb5b397ef6325942d1a66856faf7ac6fa1e4e')

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
