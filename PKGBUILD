# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=cwallpaper
pkgver=0.3.2
pkgrel=2
pkgdesc="Front-end for fbsetbg, esetroot, feh and other wallpaper changers"
arch=('i686' 'x86_64')
url="http://cwallpaper.sourceforge.net/index.php"
license=('GPL')
depends=('gtk2')
conflicts=('cwallpaper-fltk')
makedepends=('automake' 'autoconf')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        bsetrootconfig feh_config hsetconfig)
md5sums=('85ca1399e8960097cbb6580dceb47163'
         '707ddfe918170b2e9ac05c7be8d35cd2'
         '24dd59429b9a39b99ba294b1525c47db'
         '376a927d5f129efe19dd8a69c76dc583')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  # Extra config examples
  install -m644 -D bsetrootconfig "$pkgdir/usr/share/cwallpaper/bsetrootconfig"
  install -m644 -D feh_config "$pkgdir/usr/share/cwallpaper/feh_config"
  install -m644 -D hsetconfig "$pkgdir/usr/share/cwallpaper/hsetconfig"

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  chmod a+x "$pkgdir/usr/share/cwallpaper/"*.sh
}

