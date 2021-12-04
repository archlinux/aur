# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-tweaks-oldstable
pkgver=40.0
pkgrel=1
pkgdesc="Graphical interface for advanced GNOME 3 settings (Tweak Tool) (oldstable version)"
url="https://wiki.gnome.org/Apps/Tweaks"
arch=(any)
license=(GPL)
depends=(gnome-settings-daemon-oldstable python-gobject libhandy)
makedepends=(git meson)
groups=(gnome-oldstable)
conflicts=("gnome-tweaks" "gnome-tweak-tool")
provides=("gnome-tweaks=$pkgver" "gnome-tweak-tool=$pkgver")
replaces=("gnome-tweaks" "gnome-tweak-tool")
_commit=7a16849f498c8a57d525eb9184a8b0163e2ddcbb  # tags/40.0^0
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
   meson install -C build --destdir "$pkgdir"
}

