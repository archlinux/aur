# Maintainer: Peter Smit <peter@smitmail.eu>

pkgname=nova
pkgver=2.3.4
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
md5sums=('6d7d9073d27049854170fb6aa8b71b0c')
