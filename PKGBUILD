# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=dwgsim
pkgver=0.1.10
pkgrel=3
pkgdesc='Software for simulating reads from whole genomes'
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/dnaa/index.php?title=Main_Page"
license=('GPL2')
depends=('zlib' 'perl')
conflicts=('dnaa')

# Upstream doesn't provide a way to use already-installed samtools...
source=(
"http://downloads.sourceforge.net/project/samtools/samtools/0.1.18/samtools-0.1.18.tar.bz2"
"http://downloads.sourceforge.net/project/dnaa/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)

build() {
  cd ${pkgname}-${pkgver}
  [[ ! -L samtools ]] && ln -s ../samtools-0.1.18 samtools
  sed -i -e '1s@#!/bin/perl@#!/usr/bin/perl@' scripts/*.pl
  make
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  install -m755 dwgsim dwgsim_eval scripts/*.pl ${pkgdir}/usr/bin
  install -Dm644 README ${pkgdir}/usr/share/doc/dwgsim/README
}
md5sums=('71dab132e21c0766f0de84c2371a9157'
         '7453baf4b1058a214e91d703d331ee3e')
