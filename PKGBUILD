# Maintainer: megadriver <megadriver at gmx dot com>
# Shamelessly ripped off from the a7xpg PKGBUILD, also in the AUR
# Contributor: delta48 <dark.magician.48[at]gmail[dot]com>
# added just a few touches to make it compile again
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>
# dito

pkgname=parsec47
pkgver=0.2
pkgrel=2
pkgdesc="Fast-paced retro shoot'em up in an abstract world"
arch=('i686' 'x86_64')
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/p47_e.html"
license=('custom')
depends=('sdl_mixer' 'libbulletml')
makedepends=('gdc')
source=("http://deb.debian.org/debian/pool/main/p/parsec47/parsec47_0.2.dfsg1.orig.tar.gz"
   "http://ftp.de.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.dfsg1-9.debian.tar.xz")
md5sums=('9405d210176d7bfaa447bf069f07afc2'
         '41d517c11bdce829c8036b122bee8570')


prepare() {
  cd $srcdir/p47
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd $srcdir/p47
  make
}

package() {
  cd $srcdir/p47

  # Install binaries
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname

  # Install other resources
  find {images,large,largemove,middle,middlebackmove,middlemove,middlesub,middlesub_lock,morph,morph_lock,small,smallmove,smallsidemove,small_lock,sounds} -type f -exec install -Dm644 {} $pkgdir/usr/share/games/$pkgname/{} \;

  # Install man page and debian copyright notice
  install -D -m644 ../debian/$pkgname.6 $pkgdir/usr/share/man/man6/$pkgname.6
  install -D -m644 ../debian/copyright $pkgdir/usr/share/licenses/$pkgname/copyright

  # Install desktop file and icon
  install -D -m644 ../debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 ../debian/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
