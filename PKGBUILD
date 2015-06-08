# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: dionydonny <dionydonny@gmail.com>
# Contributor: Ermanno <erm67@yahoo.it>

pkgname=chmsee
pkgver=2.0.2
pkgrel=10
arch=('i686' 'x86_64')
pkgdesc="A chm (MS HTML help file format) viewer based on xulrunner."
url="http://chmsee.googlecode.com/"
license=('GPL')
depends=('xulrunner>21.0' 'xulrunner<39.0' 'chmlib' 'desktop-file-utils')
makedepends=('python2')
source=(
	"chmsee-git::git+https://github.com/diegonc/chmsee.git#tag=pkg/v$pkgver-$pkgrel"
        chmsee)
install=chmsee.install
md5sums=('SKIP'
         '1787edd1de8aa75bd9fa75a5ab319e85')

build() {
  cd "$srcdir/$pkgname-git/src"
  cp Makefile.arch Makefile
  make -j1
}

package() {
  cd "$srcdir/$pkgname-git"

  install -d "$pkgdir"/usr/share/chmsee
  cp -a * "$pkgdir"/usr/share/chmsee
  rm -r "$pkgdir"/usr/share/chmsee/src
  install -Dm644 data/chmsee.desktop.in \
    "$pkgdir"/usr/share/applications/chmsee.desktop

  # Fix FS#25152
  sed -i -e 's/_//g' "$pkgdir"/usr/share/applications/chmsee.desktop

  install -d "$pkgdir"/usr/share/pixmaps
  install -Dm644 data/chmsee-icon.png "$pkgdir"/usr/share/pixmaps
  install -Dm755 "$srcdir"/chmsee "$pkgdir"/usr/bin/chmsee
}
