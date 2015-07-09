# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=g3dviewer
pkgver=0.2.99.4
pkgrel=1
pkgdesc="A 3D file viewer for GTK+ supporting a variety of file types"
arch=(i686 x86_64)
url="http://automagically.de/g3dviewer/"
license=('GPL')
depends=('gtkglext' 'libg3d' 'libglade')
install="$pkgname.install"
source=("http://automagically.de/files/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('b7da4a68dd18309805ea2ca081542cfd'
         '644b376a72ed514090a185d0c62dd362')

build() {
  # Does not build with -Wl,--as-needed
  export -n CFLAGS
  export LDFLAGS='-lm -lX11'
  #export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # desktop and pixmaps

  install -Dm644 ../$pkgname.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 glade/g3d48.png \
          "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
