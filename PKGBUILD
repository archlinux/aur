# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Mefju <mefju@o2.pl>

pkgname=isomaster
pkgver=1.3.13
pkgrel=1
pkgdesc="CD image editor written in GTK2"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/isomaster"
license=('GPL2')
depends=('gtk2' 'desktop-file-utils')
install=isomaster.install
source=("http://littlesvr.ca/isomaster/releases/$pkgname-$pkgver.tar.bz2")
md5sums=('0fe6a1d862feb954d8f760d23829e5b4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^#WITHOUT_NLS/WITHOUT_NLS/' Makefile
  sed -i 's/mousepad/leafpad/' Makefile
  sed -i 's/m 644/Dm 644/' Makefile

  ## uncomment to disable the messagebox when last used dir is missing ##
  #sed -i 's/if(newDir == NULL)/& return false; if (1==2)/' fsbrowser.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
