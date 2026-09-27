# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=matuwall
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast and lightweight wallpaper picker for Wayland"
arch=('x86_64')
url="https://github.com/naurissteins/Matuwall"
license=('GPL-3.0-or-later')
depends=('wayland' 'libxkbcommon' 'libpng' 'libjpeg-turbo' 'libwebp')
makedepends=('meson' 'ninja' 'pkgconf' 'wayland-protocols' 'scdoc')
optdepends=(
  'awww: apply wallpapers'
  'sweetbg: apply wallpapers'
  'matugen: generate colorschemes from the applied wallpaper'
  'python-pywal: generate colorschemes from the applied wallpaper'
)
conflicts=('matuwall-bin' 'matuwall-git')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('cdad0b7264d78526166abc798a7414777f2148a2c7a9e6237bc37147fb4bcb5f')

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
