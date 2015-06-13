# Contributor : zico <zico@dxx-rebirth.com>

pkgname=d1x-rebirth
pkgver=0.58.1
pkgrel=1
pkgdesc="An enhanced engine to play with Descent1 datas"
arch=('i686' 'x86_64')
url="http://www.dxx-rebirth.com/"
license=('custom:D1x' 'LGPL' 'custom:as-is')
depends=('sdl' 'sdl_mixer' 'mesa' 'physfs')
makedepends=('scons' 'unzip')
install=$pkgname.install
source=(http://www.dxx-rebirth.com/download/dxx/${pkgname}_v${pkgver}-src.tar.gz $pkgname.desktop $pkgname.install http://www.dxx-rebirth.com/download/dxx/res/d1xr-hires.dxa http://www.dxx-rebirth.com/download/dxx/res/d1xr-sc55-music.dxa)
noextract=(d1xr-hires.dxa d1xr-sc55-music.dxa)
md5sums=('8f43e66191fdedd0c7ff9278719accf1'
         'ded1f8c2deb3825134e1a984985684cb'
         '78c79b2b82175ebd4073edf257a9bd68'
         '7d978ce3875995e54cbf426167e88b94'
         'bf54b45a648052b2531bbb95c001403b') 

package() {
  cd $srcdir/${pkgname}_v${pkgver}-src
  sed -ie "/^PREFIX =/s|/usr/local/|/usr/|" SConstruct
  scons sharepath="/usr/share/$pkgname" || return 1
  
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/$pkgname/
  mkdir -p $pkgdir/usr/share/pixmaps/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  install -m755 $pkgname $pkgdir/usr/bin/
  cd $srcdir/
  install -m644 $srcdir/${pkgname}_v${pkgver}-src/$pkgname.xpm $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/${pkgname}_v${pkgver}-src/COPYING.txt $pkgdir/usr/share/licenses/$pkgname/
  install -m644 d1xr-hires.dxa $pkgdir/usr/share/$pkgname/
  install -m644 d1xr-sc55-music.dxa $pkgdir/usr/share/$pkgname/
} 
