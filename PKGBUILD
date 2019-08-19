# Maintainer: Nigel Michki <nigeil@yahoo.com>
pkgname=star-seq-alignment
pkgver=2.7.2a
pkgrel=1
pkgdesc="An RNA-seq alignment suite, by Alexander Dobin"
arch=('i686' 
      'x86_64')
url="https://github.com/alexdobin/STAR"
license=('GPLv3')
groups=()
conflicts=()
depends=()
makedepends=('wget'
             'gcc')
optdepends=()
source=('https://github.com/alexdobin/STAR/archive/2.7.2a.tar.gz')
md5sums=('f99240e7a863a8f1bda55a6d702af7d1')

prepare() {
#  msg2 "Downloading files"
#  cd $srcdir
#  wget $source
  msg2 "Decompressing files"
  tar -xzvf $pkgver.tar.gz -C $srcdir/
}

build() {
  cd $srcdir/STAR-$pkgver/source
  make LDFLAGSextra=-flto CXXFLAGSextra="-flto -march=native" -j 20 STAR
}

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/STAR-$pkgver/source/STAR $pkgdir/usr/bin/star-seq-alignment
}
