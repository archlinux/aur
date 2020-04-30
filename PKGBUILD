# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=fasta
pkgver=36.3.8h.2020
_pkgver=36.3.8h
pkgrel=1
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source=("http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-$_pkgver.tar.gz")
sha256sums=('ddda369ae7f03c354029f67815e58585c9ae03f3a4a8464f3bfea28cf81e92ef')

build() {
  cd "$srcdir/$pkgname-$_pkgver/src"

  if [ "${CARCH}" = "i686" ]; then
    make -f ../make/Makefile.linux32 all
  else
    make -f ../make/Makefile.linux64 all
  fi
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv bin "$pkgdir"/usr
  rm "$pkgdir"/usr/bin/README
}
