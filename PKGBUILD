pkgname=powerline-go
pkgver=1.11.0
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('git' 'go')
source=($pkgname::"https://github.com/justjanne/powerline-go/archive/v${pkgver}.tar.gz")
sha256sums=('c16fba41ec221befab6206c923859885a4ea5899d0ed3bceb78a5df0e54f4080')

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}/src"

  if [[ ! -e "${GOPATH}/src/${pkgname}-${pkgver}" ]]; then
    ln -s "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${pkgname}-${pkgver}"
  fi
}

build() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/${pkgname}-${pkgver}"
  go get
  go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -D powerline-go-${pkgver} "${pkgdir}/usr/bin/powerline-go"
}

# vim:set ts=2 sw=2 et:

