pkgname="mdhtml"
pkgver=0.1.0
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.zip")
sha512sums=("SKIP")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"
  go build -o mdhtml
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}/mdhtml" "${pkgdir}/usr/bin/mdhtml"
}
