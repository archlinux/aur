# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=swayfloatingswitcher-git
pkgver=0.2.r6.1e792be
pkgrel=1
pkgdesc="A simple Alt+Tab switcher for floating windows"
_pkgfoldername=SwayFloatingSwitcher
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("gtk3" "gtk-layer-shell" "glib2" "gobject-introspection" "libgee" "json-glib" "granite")
makedepends=(vala meson git)
optdepends=("swaync-git" "swaysettings-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "0.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
