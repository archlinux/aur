# Contributor : zico <zico@dxx-rebirth.com>

pkgname=d2x-rebirth
pkgver=0.58.1
pkgrel=1
pkgdesc="An enhanced engine to play with Descent2 datas"
arch=('i686' 'x86_64')
url="http://www.dxx-rebirth.com/"
license=('custom:D1x' 'LGPL' 'custom:as-is')
depends=('sdl' 'sdl_mixer' 'mesa' 'physfs')
makedepends=('scons' 'unzip')
install=$pkgname.install
source=(http://www.dxx-rebirth.com/download/dxx/${pkgname}_v${pkgver}-src.tar.gz $pkgname.desktop $pkgname.install http://www.dxx-rebirth.com/download/dxx/res/d2xr-sc55-music.dxa)
noextract=(d2xr-sc55-music.dxa)
md5sums=('584187fdd922d732e47a64451085eaca'
         '3771fe1979a98ed32e7a9c9be8aa80a6'
         '6836b665ac0c67117c810de77ca5e739'
         'b5bd2bea4cf904d54bddad36222aa92f')

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
  install -m644 d2xr-sc55-music.dxa $pkgdir/usr/share/$pkgname/
} 
