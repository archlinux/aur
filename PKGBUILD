# Maintainer: Matthew of Boswell <mattboswell at lockmail dot us>
# Previous Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=xbl
pkgver=1.1.6
pkgrel=1
pkgdesc="A 3D tetris/blockout game"
arch=('i686' 'x86_64')
url="http://perso.univ-lyon1.fr/thierry.excoffier/XBL/"
license=('GPL')
depends=('libxext')
makedepends=('imake' 'autoconf')
source=("http://perso.univ-lyon1.fr/thierry.excoffier/XBL/$pkgname-$pkgver.tar.gz")
sha1sums=('05b368c20fd16a99346540a5352a011b56926ef3')

build() {
  cd $pkgname-$pkgver
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"/{xbl,X11/app-defaults}
  install -d "$pkgdir/usr/share/man/man1"
  yes "" | make BINDIR="$pkgdir/usr/bin" \
                GROUP_GID=50 \
                LIBDIR="$pkgdir/usr/lib" \
                RESOURCEDIR="$pkgdir/usr/lib/X11/app-defaults" \
                SCOREDIR="$pkgdir/usr/lib/xbl" \
                MANPATH="$pkgdir/usr/share/man" install
}

# vim:set ts=2 sw=2 ft=sh et:
