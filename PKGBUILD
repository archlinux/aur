# Maintainer: Francois Garillot <francois[@]garillot.net>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=xzgv
pkgver=0.9.1
pkgrel=4
pkgdesc="A picture viewer for X, with a thumbnail-based file selector"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xzgv/"
license=('GPL')
depends=('gtk2')
optdepends=('xterm: open help files')
install=$pkgname.install
source=(http://heanet.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        xzgv.desktop
        xzgv-ldflags.patch)
md5sums=('d6452ebd4911d986fa1176086afb6e33'
         'fa2c04aa696e23e28f2dec0ef89f5493'
         'ac77492f25a6b4927d2efca966f5e03c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  unset LDFLAGS
  patch -Np1 -i "$srcdir/xzgv-ldflags.patch"

  make all
  make info
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make BINDIR="$pkgdir/usr/bin" \
       MANDIR="$pkgdir/usr/share/man/man1" \
       INFODIR="$pkgdir/usr/share/info" \
       install

  # Install desktop file and icon
  install -Dm644 "$srcdir/xzgv.desktop" "$pkgdir/usr/share/applications/xzgv.desktop"
  install -Dm644 src/icon-64.xpm "$pkgdir/usr/share/pixmaps/xzgv.xpm"
}
