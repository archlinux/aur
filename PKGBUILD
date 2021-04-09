# Maintainer: lmartinez-mirror
pkgname=frangipanni
pkgver=0.4.2
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.15.2')
# checkdepends=('jp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('395c1d7b2b0d61bfd7558cc32b3ca11bcd49abf79f7a5fb2f53a3382bbb7afa7')

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

