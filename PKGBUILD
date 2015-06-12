# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=fasta
pkgver=36.3.6d
pkgrel=2
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
depends=('zlib')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source=("http://faculty.virginia.edu/wrpearson/fasta/CURRENT/fasta-$pkgver.tar.gz")
md5sums=('15917e115b117d7dda937abc326eaa94')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  if [ "${CARCH}" = "i686" ]; then
    make -f ../make/Makefile.linux32 all
  else
    make -f ../make/Makefile.linux64 all
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver/bin"

  for FILE in $(ls); do
      install -Dm755 $FILE "$pkgdir/usr/bin/$FILE"
  done
  install -Dm644 ../COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

