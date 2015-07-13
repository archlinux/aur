# Maintainer: alucryd <alucryd at gmail dot com>
# Contributor: L42y <423300 at gmail dot com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac at wp dot pl>

pkgname=gnome-common-git
pkgver=3.14.0.r12.4363223
pkgrel=1
pkgdesc="Common development macros for GNOME"
arch=('any')
url="http://www.gnome.org"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git://git.gnome.org/${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./')"
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh --prefix='/usr'
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="${pkgdir}" install
  
  # resolve conflict with autoconf-archive
  rm ${pkgdir}/usr/share/aclocal/ax_check_enable_debug.m4
  rm ${pkgdir}/usr/share/aclocal/ax_code_coverage.m4
}

# vim: ts=2 sw=2 et:
