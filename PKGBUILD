pkgname=proyconwayout-git
pkgver=r63.3e18a3d
pkgrel=1
pkgdesc="Wayout takes text from standard input and outputs it to a desktop-widget on Wayland desktops"
arch=('x86_64')
url="https://git.sr.ht/~proycon/wayout"
license=('GPLV3')
options=("!buildflags")
makedepends=('git' 'meson' 'ninja')
source=("wayout::git+https://git.sr.ht/~proycon/wayout")
md5sums=('SKIP')
pkgver() {
  cd wayout
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "$srcdir/wayout"
  meson build
  ninja -C build
  mkdir -p "$pkgdir/usr/bin"
  install build/wayout "$pkgdir/usr/bin"
}
