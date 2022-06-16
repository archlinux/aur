# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=swaysettings-git
pkgver=0.4.0.r185.c3bb640
pkgrel=1
pkgdesc="A gui for setting sway wallpaper, default apps, GTK themes, etc..."
_pkgfoldername=SwaySettings
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("gtk3>=3.22" "gtk-layer-shell>=0.1" "libhandy>=1.0.0" "glib2>=2.50" "gobject-introspection>=1.68" "libgee>=0.20" "json-glib>=1.0" "granite>=6.1.0" "libxml2" "xkeyboard-config" "accountsservice" "gtk-layer-shell>=0.1" "libpulse" "bluez")
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
