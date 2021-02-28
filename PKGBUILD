# Maintainer: lmartinez
pkgname=tllist-git
_pkgname=${pkgname%-git}
pkgver=1.0.5.r0.gf2d806f
pkgrel=2
pkgdesc="A C header file only implementation of a typed linked list"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/dnkl/tllist"
license=('MIT')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}/" meson install -C build
  install -Dm 644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
