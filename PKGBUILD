pkgname=smtpdane
pkgver=0.5.4
pkgrel=2
pkgdesc='SMTP DANE testing tool'
arch=('x86_64')
url="https://github.com/PennockTech/smtpdane"
license=('MIT')
makedepends=('go')
source=("https://github.com/PennockTech/$pkgname/archive/v$pkgver.zip")
sha256sums=('22a8eafdfba8bc0b0ceaac36d5d675e59990aaa2ca8f98e132653bcaf61bacfe')

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
