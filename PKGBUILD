# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_pkgname=kubelogin
pkgver=0.0.11
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=('x86_64')
url="https://github.com/Azure/kubelogin"
license=('MIT')
makedepends=('go')
conflicts=('kubelogin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('087d6828effb1e2e23015ef69e922c17920bf15e874e77916c28f63ba6db9c3e')

build() {
  cd "$_pkgname-$pkgver"

  make
}

check() {
  cd "$_pkgname-$pkgver"

  make test
}

package() {
  cd "$_pkgname-$pkgver"

  binary_dir="bin/$(go env GOOS)_$(go env GOARCH)"
  install -Dm755 "$binary_dir/kubelogin" $pkgdir/usr/bin/kubelogin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
