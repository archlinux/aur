# Maintainer: Christopher Kobayashi <software+aur@disavowed.jp>

pkgname=vultr
pkgver=2.0.3
pkgrel=2
pkgdesc="A CLI and API client library for Vultr.com cloud environment"
arch=('x86_64' 'i686' 'aarch64')
url="http://blog.jamesclonk.io/vultr/"
license=('MIT')
makedepends=('go')
source=("https://github.com/JamesClonk/vultr/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d0258980a57ba48042515378ff1c8dc9646f104ec99ebdfe54c637477401f3b1088183b1c4b74a60c8a8f5fe634ef5e452da4c052f7e358c6d4d661ba147f925')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  echo $PWD
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
