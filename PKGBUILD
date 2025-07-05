# Maintainer: OpenSource Guy <osguy@duck.com>
pkgname=wayback-x-compatibility-layer-git
pkgver=r25.f141d5a
pkgrel=1
pkgdesc="Experimental X11 compatibility layer for Wayland"
arch=('x86_64')
url="https://github.com/kaniini/wayback"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots0.19')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols>=1.14')
provides=('wayback')
conflicts=('wayback')
source=("git+https://github.com/kaniini/wayback.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wayback"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/wayback"
  meson setup _build --prefix=/usr
  cd _build
  meson compile
}

package() {
  cd "$srcdir/wayback/_build"
  DESTDIR="$pkgdir" meson install
  install -Dm644 "$srcdir/wayback/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 