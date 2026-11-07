# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.22.0
pkgrel=1
pkgdesc='The data templating language'
arch=('x86_64')
url='https://jsonnet.org/'
license=('Apache')
depends=('gcc-libs')
checkdepends=('python')
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

sha512sums=('5f076f741b131bc920d316d2857e58fa9797e8d010104660a07db066cbb1c459c7fcc29f2c5f3e5165ff41c2cc1b57a253dfc4d94bd0127500f00d34ea4d5577')
