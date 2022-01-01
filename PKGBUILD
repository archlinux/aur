# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_pkgname=kubelogin
pkgver=0.0.10
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=('x86_64')
url="https://github.com/Azure/kubelogin"
license=('MIT')
makedepends=('git' 'go')
conflicts=('kubelogin')

source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  make
}

check() {
  cd "$pkgname-$pkgver"

  make test
}

package() {
  cd "$pkgname-$pkgver"

  binary_dir="bin/$(go env GOOS)_$(go env GOARCH)"
  install -Dm755 "$binary_dir/kubelogin" $pkgdir/usr/bin/kubelogin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
