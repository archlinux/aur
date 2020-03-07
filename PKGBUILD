pkgname=gnome-online-accounts-git
_pkgname=gnome-online-accounts
pkgver=3.35.90+2+g72028173
pkgrel=1
pkgdesc="Single sign-on framework for GNOME"
url="https://wiki.gnome.org/Projects/GnomeOnlineAccounts"
arch=(x86_64)
license=(LGPL)
depends=(webkit2gtk json-glib libnotify rest libsecret krb5 gcr)
makedepends=(gobject-introspection gtk-doc vala git meson)
optdepends=('gvfs-goa: Virtual file systems, e.g. OwnCloud'
            'gvfs-google: Google Drive')
provides=('gnome-online-accounts')
conflicts=('gnome-online-accounts')
source=("git+https://gitlab.gnome.org/GNOME/gnome-online-accounts.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    -D lastfm=true \
    -D media_server=true \
    -D gtk_doc=true \
    -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
