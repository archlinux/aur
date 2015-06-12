# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=phylip
pkgver=3.696
pkgrel=1
pkgdesc="A collection of programmes for evolutive genetics and inferring phylogenies"
arch=('i686' 'x86_64')
url=("http://evolution.genetics.washington.edu/phylip.html")
source=("http://evolution.gs.washington.edu/phylip/download/phylip-$pkgver.tar.gz")
optdepends=('java-runtime')
license=('custom')
md5sums=('dbe5abc26f6089ead3dba41c2db526ee')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver/src
  mv Makefile.unx Makefile
}

build() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make all
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make EXEDIR="$pkgdir"/usr/bin install

  # put fonts in the proper place.
  mkdir -p "$pkgdir"/usr/{lib,share/phylip}
  mv "$pkgdir"/usr/bin/*.so "$pkgdir"/usr/lib/
  mv "$pkgdir"/usr/bin/font* "$pkgdir"/usr/share/phylip/
  mv "$pkgdir"/usr/bin/{*.jar,*.unx} "$pkgdir"/usr/share/phylip/

  cp "$pkgdir"/usr/share/phylip/font1 "$pkgdir"/usr/share/phylip/fontfile

  # /usr/bin/factor is part of coreutils - factor -> factor_phylip
  mv "$pkgdir"/usr/bin/factor "$pkgdir"/usr/bin/factor_phylip

  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
