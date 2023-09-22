pkgname="mdhtml"
pkgver=0.1.3
pkgrel=2
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("a645552f52915db9594fa03c0cb1bc7084f1ea95556c0b94609258b4ca3859a7f3c56bc74a961ba107157f31c20f7818d5c5e5bd7c519b9a48c59537eb6aebaa")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"
  go build -o mdhtml cmd/main/main.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}/mdhtml" "${pkgdir}/usr/bin/mdhtml"
}
