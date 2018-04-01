# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=openexr_viewers
pkgver=2.2.1
pkgrel=1
pkgdesc="exrdisplay and playexr OpenEXR image viewers"
arch=('i686' 'x86_64')
url="http://www.openexr.com/"
license=('custom')
depends=('fltk' 'freeglut' 'libgl' 'openexr')
optdepends=('nvidia-cg-toolkit: for playexr')
# this makepepend is optional but without it playexr is not built
makedepends=('nvidia-cg-toolkit')
source=(http://download.savannah.nongnu.org/releases/openexr/$pkgname-$pkgver.tar.gz)
md5sums=('f68d5cb2c09420f26c967a6411c463a9')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  # pdf documentation is enough
  rm "$pkgdir"/usr/share/doc/OpenEXR_Viewers-$pkgver/OpenEXRViewers.odt
}

# vim:set ts=2 sw=2 et:
