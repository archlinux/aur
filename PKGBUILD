pkgname="mdhtml"
pkgver=1.0
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("40c6c0026ef6c2a9ad2059a911705b9afdabdf8e2cd4734b3240be725234df6686a3cb6a9ca00f353262324455546bb0ae51af9e233dbc5fbee1a56deb85bf83")

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
