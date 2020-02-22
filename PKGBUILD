# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.15.0
pkgrel=1
pkgdesc='The data templating language'
arch=('x86_64')
url='https://jsonnet.org/'
license=('Apache')
depends=('gcc-libs')
checkdepends=('python2')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" CXXFLAGS="$CXXFLAGS -fPIC -Iinclude -Ithird_party/md5 -Ithird_party/json" make jsonnet jsonnetfmt libjsonnet.so libjsonnet++.so
}

check() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" make test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/include"

  install -m755 jsonnet "$pkgdir/usr/bin/jsonnet"
  install -m755 jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
  install -m755 libjsonnet.so "$pkgdir/usr/lib/libjsonnet.so"
  install -m755 libjsonnet++.so "$pkgdir/usr/lib/libjsonnet++.so"
  install -m644 include/libjsonnet.h "$pkgdir/usr/include/libjsonnet.h"
  install -m644 include/libjsonnet_fmt.h "$pkgdir/usr/include/libjsonnet_fmt.h"
  install -m644 include/libjsonnet++.h "$pkgdir/usr/include/libjsonnet++.h"
}

# vim: set ft=sh:

sha512sums=('b63c1bf82e4fc9ba3f1009ed4e4ba1010e3e7f81bd816a234e48d35607eae3cba95cab57813d35daa9f024e316bae5256340a6f8d6d884f9136cdbf062a2b351')
