# Contributor: Kan-Ru Chen <kanru@kanru.info>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-goby
_srcname=goby
pkgver=1.1
pkgrel=1
pkgdesc="a WYSIWYG presentation tool, which runs on Emacs 22 or later"
arch=('any')
url="http://www.mew.org/~kazu/proj/goby/en/index.html"
license=('BSD')
depends=('emacs')
optdepends=('netpbm: for using images' 'imagemagic: for making screen dumps')
source=(http://www.mew.org/~kazu/proj/goby/$_srcname-$pkgver.tar.gz
        LICENSE)
md5sums=('4bbe196249fcfce034eb868741f6af68'
         'a774f696f08d52a017e391c578870c4d')
install=$pkgname.install

prepare() {
  cd "$srcdir/$_srcname-$pkgver"
  sed -i 's/MKDIR   = mkdir/MKDIR   = install -d/' Makefile
}

build() {
  cd "$srcdir/$_srcname-$pkgver"
  make 
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  install -Dm644 "$srcdir/LICENSE" \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX="$pkgdir/usr" install
}
