# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic@gmail.com>

pkgname=gsignond
pkgver=1.0.6
pkgrel=1
pkgdesc='gSSO glib daemon'
arch=('x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc' 'sqlite')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'vala')
provides=('libgsignond-common.so')
backup=('etc/gsignond.conf')
_commit='3214aef8e7c84a9918d8b18fb258247d81be12e2'
source=("git+https://gitlab.com/accounts-sso/gsignond.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd gsignond

unset CPPFLAGS

  ./autogen.sh \
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
