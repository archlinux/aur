# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bcftools
pkgver=1.3.1
pkgrel=1
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2
        makefile-system-htslib.patch)
md5sums=('575001e9fca37cab0c7a7287ad4b1cdb'
         '3547e133251f4d088cb087019183efa7')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-1.3.1

  # patch Makefile to make it work with a system-provided htslib
  patch -i $srcdir/makefile-system-htslib.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1 test
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1 DESTDIR=$pkgdir install
}
