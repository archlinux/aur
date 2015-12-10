# Maintainer : Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TDY <tdy@gmx.com>

pkgname=faangband
_pkgname=FAangband
pkgver=1.4.4
pkgrel=3
pkgdesc="An Angband variant set in the First Age of Tolkien's Silmarillion world"
arch=('i686' 'x86_64')
url="http://angband.oook.cz/faangband/"
license=('GPL' 'custom')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
source=("https://github.com/NickMcConnell/FAangband/archive/master.zip")
md5sums=('efc81e8bcf5f733e0ca253715ab0b2c7')


build() {
    cd "$srcdir/FAangband-master"

    ./configure \
	--prefix=/usr \
	--bindir=/usr/bin \
	--with-configpath=/etc/${pkgname} \
	--enable-sdl

    make
}

package() {
    
    cd "$srcdir/FAangband-master"

  # Install game files
  
  make DESTDIR=$pkgdir install
  
  mkdir -p "$pkgdir/usr/share/$pkgname/info"
  
  find "$pkgdir/usr/share/$pkgname" -name delete.me -delete
  
  
  # Install readme and license
  
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  
  install -Dm644 copying.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}

