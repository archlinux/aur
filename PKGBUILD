# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=geoclue-tz
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate geoclue /etc/geolocation based on the current time zone."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/geoclue-tz"
license=('MIT')
makedepends=('go' 'git')
depends=('geoclue')
options=('!strip' '!emptydirs')
provides=("geoclue-tz")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cde7346131a7054988c756e72fa04aa51b5e141aa6399e0d1be783dba03a96cd')

build() {
  mkdir -p "${srcdir}/go/src/github.com/zquestz"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/zquestz/$pkgname"
  cd "$GOPATH/src/github.com/zquestz/$pkgname"

  go build .

  go clean -modcache
}

package() {
  cd "${srcdir}/go/src/github.com/zquestz/$pkgname"

  install -Dm 775 "geoclue-tz" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
