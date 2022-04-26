# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dmarc-cat
pkgver=0.15.0
pkgrel=1
pkgdesc='Small utility to decode the report sent by various email providers following the DMARC spec'
arch=('x86_64')
url='https://github.com/keltia/dmarc-cat'
license=('Custom')
conflicts=("${pkgname}-git")
makedepends=(go)
source=("dmarc-cat::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('886bf33ba60d601de74a1e9d437a8e09eea5c03a05b09c0f685fa02d1c174bba')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
