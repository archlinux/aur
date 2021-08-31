# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=themechanger-git
pkgver=r13.2600bbe
pkgrel=1
pkgdesc="Theme changing utility for Linux"
url="https://github.com/ALEX11BR/ThemeChanger"
arch=(x86_64)
license=(GPL)
depends=(gtk3 python-gobject)
makedepends=(git meson)
optdepends=('kvantum-qt5: Kvantum theme changing support')
provides=("themechanger")
conflicts=("themechanger")
source=("git+https://github.com/ALEX11BR/ThemeChanger")
sha256sums=('SKIP')

pkgver() {
  cd ThemeChanger
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson ThemeChanger build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
