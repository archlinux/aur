# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=swaysettings-git
pkgver=0.4.0.r185.c3bb640
pkgrel=1
pkgdesc="A gui for setting sway wallpaper, default apps, GTK themes, etc..."
_pkgfoldername=SwaySettings
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("gtk3" "gtk-layer-shell" "libhandy" "glib2" "gobject-introspection" "libgee" "json-glib" "granite" "libxml2" "xkeyboard-config" "accountsservice" "gtk-layer-shell" "libpulse" "bluez")
makedepends=(vala meson git)
optdepends=("swaync-git")
provides=("swaysettings" "sway-wallpaper" "sway-autostart")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "0.4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
