# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-dbus-glib
pkgver=0.110
pkgrel=2
pkgdesc='GLib bindings for DBUS'
arch=('x86_64')
license=('GPL')
url='https://www.freedesktop.org/wiki/Software/DBusBindings'
depends=('dbus-glib' 'lib32-glib2' 'lib32-glibc' 'lib32-dbus')
makedepends=('gcc-multilib' 'lib32-expat' 'python')
options=('!emptydirs')
source=("https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie
sha256sums=('7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825'
            'SKIP')

build() {
  cd dbus-glib-${pkgver}

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
  cd dbus-glib-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}

# vim: ts=2 sw=2 et:
