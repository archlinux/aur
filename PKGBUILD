pkgname=smtpdane
pkgver=0.5.7
pkgrel=1
pkgdesc='SMTP DANE testing tool'
arch=('x86_64')
url="https://github.com/PennockTech/smtpdane"
license=('MIT')
makedepends=('go')
source=("https://github.com/PennockTech/$pkgname/archive/v$pkgver.zip")
sha256sums=('bbda68b17375070afc4365006cdd3493b25896d8c84edac77468f1125b805fd1')

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
