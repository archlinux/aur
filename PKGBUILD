# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.19.1
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

sha512sums=('21312de71f63f4a74005f563290d67fcc2d220f043291a123af2fc834f4118f8bbc311ea8acc5dd52b13eff8c32f026a5ce6bfe3d88b4c6c770e585dd1f0b688')
