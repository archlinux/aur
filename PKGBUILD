# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=runawk
pkgver=1.6.1
pkgrel=2
pkgdesc="AWK wrapper that provides support for modules"
arch=('i686' 'x86_64')
dpends=('bash')
makedepends=('bmake' 'mk-configure')
url="https://github.com/cheusov/runawk"
license=('MIT')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('4f0faf7ef1413aab91203a17cf84be729a23ac07337863e2c290131468376521')

build() {
  cd $pkgname-$pkgname-$pkgver

  msg 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  mkc_compiler_settings
  mkcmake all
}

check() {
  cd $pkgname-$pkgname-$pkgver

  msg 'Testing...'
  mkcmake test
}

package() {
  cd $pkgname-$pkgname-$pkgver

  msg 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  mkcmake DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/README
}
