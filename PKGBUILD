# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>

pkgname=9menu
pkgver=1.8
pkgrel=5
pkgdesc='Simple and easily configurable X-menu / program launcher.'
arch=('i686 x86_64')
license=('custom')
url='ftp://freefriends.org/arnold/Source/'
depends=('libxext')
makedepends=('imake')
source=("ftp://freefriends.org/arnold/Source/$pkgname-$pkgver.shar.gz")
md5sums=('3947bbd16be0f3146208fcfbe0146071')

prepare() {
  cd "$srcdir"
  test -d $pkgname-$pkgver || mkdir $pkgname-$pkgver
  cd $pkgname-$pkgver
  sh ../$pkgname-$pkgver.shar
  tail -n22 README > LICENSE
  ln -s 9menu.1 9menu.man
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install install.man
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/9menu/license.txt"
}
