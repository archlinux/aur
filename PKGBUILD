# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=waybar-battery-module-git
pkgver=0.1.r16.90bc8c6
pkgrel=1
pkgdesc="Show all compatible batteries in waybar as tooltips"
_pkgfoldername=waybar-battery-module
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("glib2>=2.50" "gobject-introspection>=1.68")
makedepends=(vala meson git)
optdepends=("swaync-git" "swaysettings-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgfoldername
  git checkout main
  git pull
}

build() {
  arch-meson $_pkgfoldername build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
