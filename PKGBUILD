# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fisch02

pkgname=gnome-online-accounts-git
pkgver=3.53.2.r1.ga25cb59
pkgrel=2
pkgdesc="Single sign-on framework for GNOME"
url="https://wiki.gnome.org/Projects/GnomeOnlineAccounts"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(webkit2gtk json-glib libnotify librest libsecret krb5 gcr-4 gtk4 libadwaita)
makedepends=(gobject-introspection gtk-doc vala git meson glib2-devel gi-docgen)
optdepends=('gvfs-goa: Virtual file systems, e.g. OwnCloud'
            'gvfs-google: Google Drive')
provides=(gnome-online-accounts libgoa libgoa-git)
conflicts=(gnome-online-accounts libgoa libgoa-git)
source=("git+https://gitlab.gnome.org/GNOME/gnome-online-accounts.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-online-accounts
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-online-accounts build \
    -D documentation=true \
    -D man=true

  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
