# Maintainer: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname='mlmmj'
pkgver=1.3.0
pkgrel=1
pkgdesc='Simple and slim mailing-list manager inspired by ezmlm'
depends=('sh')
arch=('i686' 'x86_64')
url='http://mlmmj.org/'
license=('MIT')
source=("http://mlmmj.org/releases/$pkgname-$pkgver.tar.bz2")
sha256sums=('1c5d898143433147aa1b448fe041b2eecf6ab1601d451d426441a0a63008f242')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install

  install -D -m 0644 LICENSE  $pkgdir/usr/share/licenses/mlmmj/LICENSE
  install -D -m 0644 COPYING  $pkgdir/usr/share/licenses/mlmmj/COPYING
  install -D -m 0644 AUTHORS  $pkgdir/usr/share/licenses/mlmmj/AUTHORS
  install -D -m 0644 FAQ      $pkgdir/usr/share/doc/mlmmj/FAQ
  install -D -m 0644 TUNABLES $pkgdir/usr/share/doc/mlmmj/TUNABLES
  install -D -m 0644 UPGRADE  $pkgdir/usr/share/doc/mlmmj/UPGRADE

  for f in `ls README*`; do
      install -D -m 0644 $f $pkgdir/usr/share/doc/mlmmj/$f
  done
}
