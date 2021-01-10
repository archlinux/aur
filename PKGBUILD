# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-dbus-glib-git
pkgver=0.110
pkgrel=1
pkgdesc='GLib bindings for DBUS'
arch=('x86_64')
license=('GPL')
url='https://www.freedesktop.org/wiki/Software/DBusBindings'
depends=('dbus-glib' 'lib32-glib2' 'lib32-glibc' 'lib32-dbus')
makedepends=('gcc-multilib' 'lib32-expat' 'python')
provides=(lib32-dbus-glib)
conflicts=(lib32-dbus-glib)
options=('!emptydirs')
source=("git+https://gitlab.freedesktop.org/dbus/dbus-glib.git")
#validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie
sha256sums=('SKIP')

pkgver() {
  cd dbus-glib
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd dbus-glib

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-bash-completion \
    --disable-checks \
    --disable-gtk-doc-html \
    --disable-static
  make
}

package() {
  cd dbus-glib

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}

# vim: ts=2 sw=2 et:
