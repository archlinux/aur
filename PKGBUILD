# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.11.2
pkgrel=1
pkgdesc='The data templating language'
arch=('x86_64')
url='http://jsonnet.org/'
license=('Apache')
depends=('gcc-libs')
checkdepends=('python2')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" CXXFLAGS="$CXXFLAGS -fPIC -Iinclude -Ithird_party/md5" make jsonnet libjsonnet.so libjsonnet++.so
}

check() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" make test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/include"

  install -m755 jsonnet "$pkgdir/usr/bin/jsonnet"
  install -m755 libjsonnet.so "$pkgdir/usr/lib/libjsonnet.so"
  install -m755 libjsonnet++.so "$pkgdir/usr/lib/libjsonnet++.so"
  install -m644 include/libjsonnet.h "$pkgdir/usr/include/libjsonnet.h"
  install -m644 include/libjsonnet++.h "$pkgdir/usr/include/libjsonnet++.h"
}

# vim: set ft=sh:

sha512sums=('f1bd76d47275b2b57dc85cdc82ac7126a7504faabbf404350a35c94939b9aed99e9313d2e8f6170caf06726806d765114a6b45e115178825ae157b3d0847f1c7')
