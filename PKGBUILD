pkgname="mdhtml"
pkgver=0.2.2
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("e47c92980d078a671ad9e2785615ee72a09bf5261208a825b982158b683bc6254d312ee9af04df6db54e6c0da6bbaddbaedc1e19a2230bec954b38b2493bdf70")

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
