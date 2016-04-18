# Maintainer: jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=cairo-dock-themes
pkgver=1.6.3.1
pkgrel=4
pkgdesc="Themes for cairo-dock"
url="http://sourceforge.net/projects/cairo-dock.berlios/files/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('librsvg' 'cairo-dock')
makedepends=('autoconf' 'intltool' 'automake' 'libtool' 'perl-xml-parser' 'pkgconfig')
source=("http://downloads.sourceforge.net/project/cairo-dock.berlios/$pkgname-$pkgver.tar.bz2" "fixinstallpath.patch")
md5sums=('ac73b44de2727a384d4c163b31321cca' '36e03dcdd884d308318ff1042de3e1cb')

package() {
	cd $pkgname-$pkgver
    echo "Patching installpath"
    patch -p1 < "$startdir/fixinstallpath.patch" || return 1
  	autoreconf -isvf || return 1
  	./configure --prefix=/usr --disable-static || return 1
  	make || return 1
  	make install DESTDIR=$pkgdir || return 1
}
