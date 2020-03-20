# Maintainer: Brian Biduock <bidulock@openss7.org>

pkgname=aterm
pkgver=1.0.1
pkgrel=7
pkgdesc="An xterm replacement with transparency support"
arch=('i686' 'x86_64')
url="http://aterm.sourceforge.net/"
license=('GPL')
depends=('librsvg' 'libjpeg-turbo' 'libxinerama')
makedepends=('libxt')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	"aterm.png"
	"aterm.desktop")
md5sums=('c2eede028e1011e0ec7035cf319c9b5a'
         '059c69fad0ea2dc03d1e64023481e827'
         '0de3ff0a366d1fe1caf2b07c436af9cf')
sha1sums=('a975753b415306a0734efc3773de8a86129bb54b'
          'afd78f13fdba838e4bc2ce450a02f5152a4aa1f2'
          '52dc5abfebacba14c8702deae67390013f046218')
    
prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's%<sys/stropts.h>%<sys/ioctl.h>%;s%I_PUSH,%TIOCPKT,%' src/command.c

}
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-transparency=yes \
    --enable-background-image --enable-fading --enable-menubar \
    --enable-graphics
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/aterm.png" "$pkgdir/usr/share/pixmaps/aterm.png"
  install -Dm644 "$srcdir/aterm.desktop" "$pkgdir/usr/share/applications/aterm.desktop"
}
