pkgname="mdhtml"
pkgver=0.2.1
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("c64e05e3d7544dde2a2c782456aa422ee41586e0c3a035523b569528cdd780529772404f5c5d095130b5adac60703ceddee77c74d1f222b314a8a9bb6f96e0fb")

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
