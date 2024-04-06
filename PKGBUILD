pkgname=helm-ls
pkgver=0.0.14
pkgrel=1
pkgdesc='Language server for Helm'
arch=('i686' 'x86_64')
license=('MIT')
depends=(glibc)
makedepends=('go')
provides=(helm-ls)
url=https://github.com/mrjosh/helm-ls
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrjosh/helm-ls/archive/v${pkgver}.tar.gz")
sha256sums=('8df2cd5eeaf21e046bcab843d8fc280d355c65627ca1d084486b986a2114fa94')

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

