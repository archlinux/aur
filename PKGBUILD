# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#

pkgname=sidplay-libs
pkgver=2.1.1
pkgrel=1
pkgdesc='The new generation of SID emulation'
arch=('i686' 'x86_64')
url="http://sidplay2.sourceforge.net"
license=('GPL')
makedepends=('cmake')
source=(
  "http://mirrors.xbmc.org/build-deps/sources/$pkgname-$pkgver.tar.gz"
  'sidplay-libs-01-m4-tests.patch'
  'sidplay-libs-02-inherited.patch'
  'sidplay-libs-03-operator.patch'
  'sidplay-libs-04-includes.patch')
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

_prefix='/usr'

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 -i "$srcdir/sidplay-libs-01-m4-tests.patch"
  patch -p1 -i "$srcdir/sidplay-libs-02-inherited.patch"
  patch -p1 -i "$srcdir/sidplay-libs-03-operator.patch"
  patch -p1 -i "$srcdir/sidplay-libs-04-includes.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=$_prefix --enable-shared --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
