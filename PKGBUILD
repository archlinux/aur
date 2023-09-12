pkgname="mdhtml"
pkgver=0.1.1
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("ea87e2b112cae6ba4df7775d71c94fd6c37f3fcec950c9d57920d4f3e2910edb60f3bee883818061323347c065a520b1e4e9bb7fc3f9ce6b45941ca82fd35aa3")

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
