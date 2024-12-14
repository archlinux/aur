# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=swaysettings-git
pkgver=0.5.0.r219.501052e
pkgrel=1
pkgdesc="A gui for setting sway wallpaper, default apps, GTK themes, etc..."
_pkgfoldername=SwaySettings
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("gtk4" "gtk4-layer-shell" "libadwaita" "glib2" "gobject-introspection" "libgee" "json-glib" "granite7" "libxml2" "xkeyboard-config" "accountsservice" "libpulse" "bluez" "blueprint-compiler" "libgtop")
makedepends=(vala meson git)
provides=("swaysettings" "sway-wallpaper" "sway-autostart")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "0.5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgfoldername
  git checkout main
  git pull
}

build() {
  cd $_pkgfoldername
  arch-meson build
  ninja -C build
}

package() {
  cd $_pkgfoldername
  DESTDIR="$pkgdir" meson install -C build
}
