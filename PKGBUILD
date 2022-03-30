# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>

pkgname=color-scheme-simulator-git
pkgver=r10.2c3452f
pkgrel=1
pkgdesc="A quick portal implementation + GUI to test the upcoming dark style preference"
arch=(x86_64)
url="https://gitlab.gnome.org/exalm/color-scheme-simulator"
license=('GPL3')
depends=('xdg-desktop-portal')
makedepends=('meson' 'git' 'vala' 'libadwaita')
optdepends=("libadwaita: for GUI")
install=$pkgname.install
source=("git+https://gitlab.gnome.org/exalm/color-scheme-simulator.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"
}
