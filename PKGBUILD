# Maintainer: David Birks <david@birks.dev>

pkgname=nova
pkgver=1.0.2
pkgrel=1
pkgdesc='A cli tool to find outdated Helm charts running in your Kubernetes cluster'
arch=(x86_64)
url='https://github.com/FairwindsOps/nova'
license=(Apache)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('46173b5257ab78b9a5a57e258638760b8f4dad52929d1ff61d9813e2b803c0ff')

build() {
  cd Nova-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  install -Dm 755 "$srcdir"/Nova-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 "$srcdir"/Nova-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
