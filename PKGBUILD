# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-dbus-glib
pkgver=0.108
pkgrel=1
pkgdesc='GLib bindings for DBUS'
arch=('x86_64')
license=('GPL')
url='https://www.freedesktop.org/wiki/Software/DBusBindings'
depends=('dbus-glib' 'lib32-glib2' 'lib32-glibc' 'lib32-dbus')
makedepends=('gcc-multilib' 'lib32-expat')
options=('!emptydirs')
source=("https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie
sha256sums=('9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c'
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
