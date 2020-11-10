# Maintainter: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=fasta
pkgver=36.3.8h.2020.05.04
_pkgver=36.3.8h_04-May-2020
pkgrel=1
pkgdesc="Fast protein or a fast nucleotide comparison"
arch=('i686' 'x86_64')
license=('custom')
url="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml"
source=($pkgname-$_pkgver.tar.gz::https://github.com/wrpearson/fasta36/archive/v$_pkgver.tar.gz)
sha256sums=('d13ec06a040e4d77bf6913af44b705d3ecc921131da018e71d24daf47d3664d3')

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
