pkgname="mdhtml"
pkgver=0.3.1
pkgrel=1
pkgdesc="Really simple CLI Markdown to HTML converter with styling support"
url="https://codeberg.org/Tomkoid/mdhtml"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Tomkoid/mdhtml/archive/${pkgver}.tar.gz")
sha512sums=("e6b2fcf53f7c1eb133d35cb265b4356c5cfc47dbb4f58c2bcdeaa0b1cc64b31097aeaf9cca37c89d48f572650b9112fe17937b4f08dc543781c17cbb48e473d3")

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
