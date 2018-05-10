# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.10.0
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

sha512sums=('1154064e1f9238ab3eafdb1754e675bc0cdf5649f586b0cb667371e98d3cb61ca224e42be33dfcfb5030e254869bf9a3b29d72f2b22b4a50be8556ccbc424510')
