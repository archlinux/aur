# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic@gmail.com>

pkgname=gsignond
pkgver=1.0.4
pkgrel=1
pkgdesc='gSSO glib daemon'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('dbus' 'libgsignon-glib' 'sqlite')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
backup=('etc/gsignond.conf')
source=('git+https://gitlab.com/accounts-sso/gsignond.git#commit=deb5f757')
sha256sums=('SKIP')

prepare() {
  cd gsignond

  mkdir -p m4
  gtkdocize
  aclocal
  autoheader
  libtoolize --copy --force
  autoconf
  automake --add-missing --copy
  autoreconf --install --force
}

build() {
  cd gsignond

  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --enable-dbus-type='session'
  make
}

package() {
  cd gsignond

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
