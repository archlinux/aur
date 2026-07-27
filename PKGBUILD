# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.8.1
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="https://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9dd80e19b2287abf2689b8f9fd424fdfad9abdc51b69e3a550579db69d6c8f6f')

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
