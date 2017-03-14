# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.4
pkgrel=1
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib')
source=(https://github.com/samtools/bcftools/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2
        makefile-system-htslib.patch)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-$pkgver

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

md5sums=('50ccf0a073bd70e99cdb3c8be830416e'
         'baba7d2fc8947c7ec29ff4498637ea85')
