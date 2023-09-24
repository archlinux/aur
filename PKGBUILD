# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.6.9
pkgrel=2
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7097264e7da0e7ac209e5be5e50f07f17593e2753607325870131af3000ccaf2')

build() {
  mkdir -p "${srcdir}/go/src/github.com/zquestz"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/zquestz/s"
  cd "$GOPATH/src/github.com/zquestz/s"

  go build .

  go clean -modcache
}

package() {
  cd "${srcdir}/go/src/github.com/zquestz/s"

  install -Dm 775 "s" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
