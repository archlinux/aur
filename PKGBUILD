# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=lunchbox
pkgver=0.3.3
_fullver=0.3-3  # bleh dashes in version
_tarver=0.3  # why!
pkgrel=1
pkgdesc="An innovative (and beta) hybrid floating/tiling WM."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lunchbox/"
license=('GPL3')
depends=('cairo' 'libxcursor')
source=("http://$pkgname.googlecode.com/files/${pkgname}_${_fullver}.tar.gz")
md5sums=('accb26993329f919560f0dee19224653')

build() {
  cd "$srcdir/${pkgname}-${_tarver}"
  install -d "$pkgdir/usr/bin"  # makefile bug
  rm themes/.lunchbox  # symlink to author's home
  sed -i 's|/local/lunchbox|/share/lunchbox|' theme.c  # source does not care about datadir
  make datadir=/usr/share
}

package() {
  cd "$srcdir/${pkgname}-${_tarver}"
  make DESTDIR="$pkgdir" datadir=/usr/share install
}

