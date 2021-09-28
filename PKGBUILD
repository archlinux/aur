# Maintainer: Peter Smit <peter@smitmail.eu>

pkgname=nova
pkgver=2.3.3
pkgrel=1
pkgdesc='A cli tool to find outdated Helm charts running in your Kubernetes cluster'
arch=(x86_64)
url='https://github.com/FairwindsOps/nova'
license=(Apache)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")

build() {
  cd nova-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  install -Dm 755 "$srcdir"/nova-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 "$srcdir"/nova-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('2fd43c45af80f34518afc0b8481c0e3b')
