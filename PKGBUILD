# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=proovread
pkgver=2.12
pkgrel=1
pkgdesc="large-scale high accuracy PacBio correction through iterative short read consensus"
arch=('any')
url="https://github.com/BioInf-Wuerzburg/proovread"
license=('PerlArtistic')
depends=('blasr-git' 'perl-log-log4perl' 'blast+>=2.2.24' 'samtools>=1.1' 'shrimp')
source=("$pkgname::git+https://github.com/BioInf-Wuerzburg/proovread#tag=proovread-2.12")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname

  git submodule init
  git submodule update
}

build() {
  cd $srcdir/$pkgname/util/bwa

  make
}

package() {
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/bin \
           $pkgdir/usr/lib/perl5/vendor_perl

  for file in bin/* util/SeqChunker/bin/* ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .pl)
  done

  cp -r lib/* $pkgdir/usr/lib/perl5/vendor_perl
}
