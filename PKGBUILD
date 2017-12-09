# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=fasta
pkgver=36.3.8e
pkgrel=1
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
depends=('zlib')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source_i686=("http://faculty.virginia.edu/wrpearson/fasta/CURRENT/fasta-$pkgver-linux32.tar.gz")
source_x86_64=("http://faculty.virginia.edu/wrpearson/fasta/CURRENT/fasta-$pkgver-linux64.tar.gz")
md5sums_i686=('1bdec4e78caf4e7fa392316c5f35686b')
md5sums_x86_64=('8c857d80951fedfa870a94fd9ab1438a')

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
