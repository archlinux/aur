# Maintainer: slimb

_pkgname=libopenrazer
pkgname=z3ntu-libopenrazer-git
pkgver=r81.1829dab
pkgrel=1
pkgdesc="Subproject of https://github.com/z3ntu/RazerGenie"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL3')
depends=('qt5-base' 'razer_test')
makedepends=('git' 'meson' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/libopenrazer.git')
sha512sums=('SKIP')

pkgver() {
   cd "$_pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   arch-meson "$_pkgname" build
   ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
