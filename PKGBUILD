# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=dbus-glib-git
pkgver=0.110
pkgrel=1
pkgdesc="GLib bindings for DBUS"
url="https://www.freedesktop.org/wiki/Software/DBusBindings"
arch=(x86_64)
license=('GPL')
depends=('dbus' 'glib2')
makedepends=('python')
provides=(dbus-glib)
conflicts=(dbus-glib)
source=("git+https://gitlab.freedesktop.org/dbus/dbus-glib.git")
sha256sums=('SKIP')
#validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90')

pkgver() {
  cd dbus-glib
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd dbus-glib

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-gtk-doc \
    --disable-static
  make
}

package() {
  cd dbus-glib
  _c=/usr/share/bash-completion/completions
  make DESTDIR="$pkgdir" install completiondir=$_c
  mv "$pkgdir$_c"/{dbus-bash-completion.sh,dbus-send}
}
