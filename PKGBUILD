pkgname=helm-ls
pkgver=0.0.3
pkgrel=1
pkgdesc='Language server for Helm'
arch=('i686' 'x86_64')
license=('MIT')
depends=(glibc)
makedepends=('git' 'go')
provides=(helm-ls)
url=https://github.com/mrjosh/helm-ls
source=(git+https://github.com/mrjosh/helm-ls#tag=v$pkgver)
sha256sums=(SKIP)

build() {
  cd "$srcdir/$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOLDFLAGS="-linkmode=external"

  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bin/helm_ls -t "$pkgdir/usr/bin"
}

