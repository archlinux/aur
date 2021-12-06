# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-tweaks-338
pkgver=3.34.1
pkgrel=2
pkgdesc="Graphical interface for advanced GNOME 3 settings (Tweak Tool) (gnome 3.38 version)"
url="https://wiki.gnome.org/Apps/Tweaks"
arch=(any)
license=(GPL)
depends=(gnome-settings-daemon-338 python-gobject libhandy0)
makedepends=(git meson)
groups=(gnome-338)
conflicts=("gnome-tweaks" "gnome-tweak-tool")
provides=("gnome-tweaks=$pkgver" "gnome-tweak-tool=$pkgver")
replaces=("gnome-tweaks" "gnome-tweak-tool")
_commit=6e8fedad09c48fe942156ebcf3a88dc3c9698e54  # tags/3.34.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-tweaks.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gnome-tweaks
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gnome-tweaks build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

