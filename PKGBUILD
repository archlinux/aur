pkgname=luminahud-git
pkgver=1.0.0
pkgrel=1
pkgdesc="IMGUI BACKGROUND HUD"
arch=('x86_64')
url="https://github.com/delmath/LuminaHUD"
license=('MIT')

depends=('glfw-x11' 'libx11' 'mesa' 'imgui')
makedepends=('git' 'gcc')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LuminaHUD"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/LuminaHUD"
  make
}

package() {
  cd "$srcdir/LuminaHUD"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
