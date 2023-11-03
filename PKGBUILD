pkgname="mdhtml"
pkgver=0.3.0
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("f4640fa7ac759a1bed3d64346791fe3bc365574e6b0df51c084dec6301d3e2fcf9cb8a064666eb4f8fa34d6f6612759c8e30873d749f9fbb6602f1623c9080f0")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd $pkgname
  go build -o mdhtml . 
}

package() {
  install -Dm755 "${pkgname}/mdhtml" "${pkgdir}/usr/bin/mdhtml"
}
