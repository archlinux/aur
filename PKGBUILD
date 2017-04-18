# Maintainer: badcasa <sebastian.stueber [at] t-online [dot] de>
pkgname=isabelle
pkgver=2016_1
pkgrel=1
pkgdesc="A generic proof assistant. It allows mathematical formulas to be expressed in a formal language and provides tools for proving those formulas in a logical calculus."
arch=('i686' 'x86_64')
url="https://www.cl.cam.ac.uk/research/hvg/Isabelle/"
license=('custom:BSD')
groups=('science')
depends=('perl' 'perl-libwww' 'python2')
if test "$CARCH" == x86_64; then
	optdepends+=('lib32-glibc: for improved performance of Poly/ML on x86_64 machines'
               'lib32-gcc-libs: for improved performance of Poly/ML on x86_64 machines')
fi
optdepends=('texlive-core: document preparation')
source=(https://www.cl.cam.ac.uk/research/hvg/Isabelle/dist/Isabelle${pkgver//_/-}_app.tar.gz
        isabelle.desktop)
        
md5sums=('7fbfd0af7ac722e3f961951106887f8a'
         'd33d0dd09e9105f4f043bd5e59458481')
sha256sums=('b9ac02fc086c7242a2424839d4daf9d4d24e9360fe3368fe20598758ab7b2cf0'
            '84b61a83692939ca9e08402f1c55a06e4ccac8941664435d20b0ef0ceed9f43a')
        
build() {
	cd "$srcdir/Isabelle${pkgver//_/-}"
	./bin/isabelle build Pure
	./bin/isabelle build HOL
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
	cd "$srcdir/Isabelle${pkgver//_/-}"
	mkdir -p $pkgdir/opt/isabelle
	cp -r * $pkgdir/opt/isabelle/
	$pkgdir/opt/isabelle/bin/isabelle install -d /opt/isabelle $pkgdir/usr/bin
}
