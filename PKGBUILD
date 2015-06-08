# Maintainer: Black_Codec <orso DOT f DOT regna AT gmail DOT com>


_pkgbasename=gtk-engine-nodoka
pkgname=lib32-$_pkgbasename
pkgver=0.7.5
pkgrel=2
pkgdesc="Default gtk engine provided by Fedora8. Multilib."
arch=('x86_64')
url="https://fedorahosted.org/nodoka/"
license=('GPL')
depends=('lib32-gtk2>2.18' "$_pkgbasename")
makedepends=('gcc-multilib')
source=(https://fedorahosted.org/releases/n/o/nodoka/gtk-nodoka-engine-$pkgver.tar.gz)
md5sums=('22227adf29231ba2b87202ac3522e70f')
options=(!libtool)

package() {

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $srcdir/gtk-nodoka-engine-$pkgver
  sed -i 's|/usr/bin/install|/bin/install|g' $srcdir/gtk-nodoka-engine-$pkgver/src/Makefile.in
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-animation
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm -rf "$pkgdir/usr/share"
}
