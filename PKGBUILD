# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=paexec
pkgver=1.1.2
pkgrel=1
pkgdesc="Parallel executor, distributes tasks over network or CPUs"
arch=('i686' 'x86_64')
depends=('runawk')
makedepends=('bmake' 'libmaa' 'mk-configure' 'clang')
url="https://github.com/cheusov/paexec"
license=('MIT')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('b2b624538f006a4488dc8b9f72f8d7c030e5893256eed0a2980dca5840de972d')

build() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man CC=clang
  export SUBPRJ_DFLT='paexec doc examples'
  mkc_compiler_settings
  mkcmake all
}

check() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Testing...'
  mkcmake test
}

package() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='paexec doc examples'
  mkcmake DESTDIR="$pkgdir" install
}
