# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto
pkgver=1.8.4
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes."
arch=(x86_64 aarch64)
url="https://github.com/okteto/okteto"
license=(Apache)
optdepends=(kubectl)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/okteto/okteto/archive/${pkgver}.tar.gz")
sha256sums=('fc3629699355e7ab66661d5c77d34eb8b75ba8cb1ed8beaad74a5ab88a211ec6')

build() {
  export GOPATH="$srcdir"/gopath
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION_STRING=$pkgver build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/okteto "$pkgdir"/usr/bin/okteto
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"
}
