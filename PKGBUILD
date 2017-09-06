# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Mark Taylor <skymt0 at gmail dot com>

pkgbase=argtable
pkgname=('argtable' 'argtable-docs')
pkgver=2.13
pkgrel=2
pkgdesc="An ANSI C command line parser"
arch=('i686' 'x86_64' 'armv7h')
url="http://argtable.sourceforge.net/"
license=('LGPL')
source=(https://downloads.sourceforge.net/argtable/$pkgname${pkgver/./-}.tar.gz)
sha1sums=('bce828c64c35e16f4c3f8e1f355e4a2a97fe3289')

build() {
  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  ./configure --prefix=/usr
  make
}

check_argtable() {
  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  make -k check
}

package_argtable() {
  options=('!libtool')

  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  sed -i '/^install-data-am:/s/install-dist_exampleDATA //' Makefile
  make SUBDIRS="src tests" DESTDIR="$pkgdir/" install
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_argtable-docs() {
  pkgdesc+=" - documentation and examples"
  arch=('any')

  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  make -C doc DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-dist_exampleDATA
}

# vim:set ts=2 sw=2 et:
