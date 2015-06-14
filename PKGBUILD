# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=avr-libc-svn
_pkgname=avr-libc
pkgver=2454
pkgrel=1
pkgdesc="The C runtime library for the AVR family of microcontrollers"
arch=('any')
url="http://savannah.nongnu.org/projects/avr-libc/"
license=('BSD')
depends=('avr-gcc')
makedepends=('svn')
provides=('avr-libc')
conflicts=('avr-libc')
options=('!strip' 'libtool' 'staticlibs')
source=("$_pkgname"::'svn+http://svn.savannah.nongnu.org/svn/avr-libc/trunk/avr-libc/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo "$(svnversion)"
}

build() {
  cd "$srcdir/$_pkgname"

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  ./bootstrap
  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
