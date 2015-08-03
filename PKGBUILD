# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=image-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Iterative Mapping and Assembly for Gap Elimination"
arch=('x86_64')
url="http://sourceforge.net/projects/image2/"
license=('custom')
depends=('bash' 'perl' 'zlib')
conflicts=('velvet')
source=(http://downloads.sourceforge.net/image2/IMAGE_version${pkgver}_64bit.zip)
md5sums=('d4694275a110149c9bc5a4acec45f60c')

prepare() {
  cd $srcdir/IMAGE_version2.4

  rm -f *~

  sed -e 's|#!/usr/bin/perl -w|#!/usr/bin/env perl|' \
      -e 's|#!/usr/bin/perl|#!/usr/bin/env perl|' \
      -e 's|#! /usr/bin/perl -w|#!/usr/bin/env perl|' \
      -e 's|#!/usr/local/bin/perl|#!/usr/bin/env perl|' \
      -i *.pl \
         nucmer
}

package() {
  cd $srcdir/IMAGE_version2.4

  for file in *.pl nucmer run.sh smalt_x86_64 ssaha2 ssaha2Build velvetg velveth ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .pl)
  done

  for example in example/* ; do
    install -Dm644 $example $pkgdir/usr/share/image/example/$(basename $example)
  done

  install -Dm644 <(echo unknown) $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
