# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=fasta
pkgver=36.3.8g
pkgrel=1
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source=("http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-$pkgver.tar.gz")
sha256sums=('41c623f9ddbcaa7b1d479665216148cb30f75be263d3584d99e4d234a38babc3')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  if [ "${CARCH}" = "i686" ]; then
    make -f ../make/Makefile.linux32 all
  else
    make -f ../make/Makefile.linux64 all
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv bin "$pkgdir"/usr
  rm "$pkgdir"/usr/bin/README
}
