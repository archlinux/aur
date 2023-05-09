# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=fasta
pkgver=36.3.8i
_pkgver=36.3.8i_14-Nov-2020
pkgrel=1
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source=($pkgname-$_pkgver.tar.gz::https://github.com/wrpearson/fasta36/archive/refs/tags/v$_pkgver.tar.gz)
sha256sums=('b4b1c3c9be6beebcbaf4215368e159d69255e34c0bdbc84affa10cdb473ce008')

build() {
  cd "$srcdir"/fasta36-$_pkgver/src

  if [ "${CARCH}" = "i686" ]; then
    make -f ../make/Makefile.linux32 all
  else
    make -f ../make/Makefile.linux64 all
  fi
}

package() {
  cd "$srcdir"/fasta36-$_pkgver

  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv bin "$pkgdir"/usr
  rm "$pkgdir"/usr/bin/README
}
