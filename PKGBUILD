# Maintainer: lmartinez-mirror
pkgname=frangipanni
pkgver=0.4.1
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.15.2')
# checkdepends=('jp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02b91a6b9b1e4b122bdff1b15138fc1eda11853e1a286a33036b70c625ccb462')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  GO111MODULE=on go build
}

# check() {
#   cd "$pkgname-$pkgver"
#   test/confidence.sh
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 frangipanni -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

