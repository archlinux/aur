# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Mark Taylor <skymt0 at gmail dot com>

pkgname=argtable
true && pkgname=('argtable' 'argtable-docs')
pkgver=2.13
pkgrel=1
pkgdesc="An ANSI C command line parser"
arch=('i686' 'x86_64')
url="http://argtable.sourceforge.net/"
license=('GPL')
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/argtable/$pkgname${pkgver/./-}.tar.gz)
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
  depends=('glibc')
  options=('!libtool')

  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  sed -i '/^install-data-am:/s/install-dist_exampleDATA //' Makefile
  make SUBDIRS="src tests" DESTDIR="$pkgdir/" install
}

package_argtable-docs() {
  true && pkgdesc="Documentation and examples for argtable"
  true && arch=('any')

  cd "$srcdir/${pkgname%-*}${pkgver/./-}"
  make -C doc DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-dist_exampleDATA
}

# vim:set ts=2 sw=2 et:
