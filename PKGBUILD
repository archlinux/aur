# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=cegui-0.5
pkgver=0.5.0b
pkgrel=1
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://crayzedsgui.sourceforge.net"
#options=('!libtool')
license=("MIT")
depends=('pcre' 'glew' 'freetype2' 'libxml2' 'devil' 'freeglut' 'silly')
conflicts=('cegui')
source=(http://downloads.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz
        CEGUIString.h)
md5sums=('b42322a33c6a06eede76b15f75694a17'
         'b0859a1316bb25ca4860a5d0052e9a04')


build() {
  cd $srcdir/CEGUI-0.5.0

  cp $srcdir/CEGUIString.h include/
  sed -i 's/ILvoid/void/' ImageCodecModules/DevILImageCodec/CEGUIDevILImageCodec.cpp

  ./configure  --prefix=/usr --enable-release --enable-shared --disable-expat --disable-tga --disable-samples --disable-xerces-c

  make
}

package() {
  cd $srcdir/CEGUI-0.5.0
 
  make DESTDIR=${pkgdir} install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

#category: lib
