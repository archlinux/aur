# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <piotr dot p dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot p dot public at gmail dot com>

pkgname=psol
#1.8.31.3 broken
#1.8.31.2 broken
pkgver=1.9.32.1
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc='PageSpeed Optimization Library'
arch=('i686' 'x86_64' 'armv6h')
url='https://developers.google.com/speed/pagespeed/psol'
license=('Apache')
options=(!strip staticlibs)
source=("$pkgname-$pkgver.tar.gz::https://dl.google.com/dl/page-speed/psol/${pkgver}.tar.gz")
# @link https://github.com/pagespeed/ngx_pagespeed/releases

package(){
  cd "$srcdir"/$pkgname
  install -dm755 "$pkgdir"/usr/lib/psol
  tar -c ./ \
    --exclude include_history.txt \
    --exclude lib/Debug \
    | tar -x -C "$pkgdir"/usr/lib/psol

  find "$pkgdir"/usr/lib/psol -type d -exec chmod 0755 '{}' ';'
  find "$pkgdir"/usr/lib/psol -type f -exec chmod 0644 '{}' ';'
  case $CARCH in
    i686)
      rm -rf "$pkgdir"/usr/lib/psol/lib/{Debug/linux/x64,Release/linux/x64}
      cd $pkgdir/usr/lib/psol/include/net/instaweb/automatic
      ln -s ../../../../lib/Release/linux/x64/pagespeed_automatic.a
      ;;
    x86_64)
      rm -rf "$pkgdir"/usr/lib/psol/lib/{Debug/linux/ia32,Release/linux/ia32}
      cd $pkgdir/usr/lib/psol/include/net/instaweb/automatic
      ln -s ../../../../lib/Release/linux/x64/pagespeed_automatic.a
      ;;
  esac
}
sha256sums=('ecfac41808ba14af3574d3ed6e3f0fbb47da8e4a9b3786b056fc6caec19f1839')
