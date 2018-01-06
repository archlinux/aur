# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=commoncpp2
pkgver=1.8.1
pkgrel=7
pkgdesc="GNU Common C++ 2"
arch=('x86_64')
url='http://www.gnu.org/software/commoncpp/'
license=('GPL' 'custom')
depends=('gcc-libs' 'zlib' 'sh')
options=('!makeflags')
validpgpkeys=('84344FAA5350F5C61D2CE4A4046AC7983903A6DD')
source=("https://ftp.gnu.org/pub/gnu/commoncpp/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('53ced4aff74e28a1d8018eb2b4974519028db3c12471ab6dff1c873578c9af4e'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i -e '50 a\#include <sys/stat.h>' inc/cc++/applog.h
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING.addendum \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
