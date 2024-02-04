pkgname=helm-ls
pkgver=0.0.10
pkgrel=1
pkgdesc='Language server for Helm'
arch=('i686' 'x86_64')
license=('MIT')
depends=(glibc)
makedepends=('go')
provides=(helm-ls)
url=https://github.com/mrjosh/helm-ls
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrjosh/helm-ls/archive/v${pkgver}.tar.gz")
sha256sums=("4674a2d22fcfe3e4d2dd92d35b143c4584b7ee3c30c20b42cc5518ec2562c69e")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOLDFLAGS="-linkmode=external"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/helm_ls -t "$pkgdir/usr/bin"
}

