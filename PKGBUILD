# Maintainer: Thibault Mondary <thibm@free.fr>
# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>


pkgname=crack-attack
pkgver=1.1.14
pkgrel=7
pkgdesc="A free OpenGL game based on the Super Nintendo classic Tetris Attack, with Fedora's patches"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/crack-attack/"
license=("GPL")
depends=('gtk2' 'sdl_mixer' 'freeglut')
makedepends=('glu' 'libxmu')
optdepends=('crack-attack-sounds: for sound effects and music')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz
        crack-attack-1.1.14-glutInit.patch
        crack-attack-1.1.14-audio.patch
        crack-attack-1.1.14-gcc43.patch
        crack-attack-1.1.14-audio-ppc.patch
)
md5sums=('262445024b0fca44508355242ea29d71' 
         '75a884a0003521099b4bb417bfe8339b'
         '6c42bef707937b3bede26dc83e865e74'
         'b6a21f65d3579a6cf3c9e48cede0b012'
         '1d24a261ea6b3a2d15328c3b7d9305d0')

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../crack-attack-1.1.14-glutInit.patch
  patch -Np1 -i ../crack-attack-1.1.14-audio.patch
  patch -Np1 -i ../crack-attack-1.1.14-gcc43.patch
  patch -Np1 -i ../crack-attack-1.1.14-audio-ppc.patch

  ./configure --enable-sound=yes --prefix=/usr --mandir=/usr/share/man
  make 
}
package(){  
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  cd data
  sed -i -e 's#Application;Games#Game;BlockGame#' crack-attack.desktop
  install -D -m644 crack-attack.desktop $pkgdir/usr/share/applications/crack-attack.desktop
  install -D -m644 crack-attack.xpm $pkgdir/usr/share/pixmaps/crack-attack.xpm
}
