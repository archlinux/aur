# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-oled
pkgver=0.1.5
pkgrel=2
pkgdesc="Control brightness on System76 OLED displays"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-oled"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'libx11'
  'libxrandr'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2607cfc25b41446a16f01dc8c2eb49d6922ee8991b5fb655b571c2d4e79f9da6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  ARGS+=" --frozen" make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
