# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ferret
pkgver=0.9.0
pkgrel=1
pkgdesc='A web scraping system aiming to simplify data extraction from the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.montferret.dev'
license=('Apache')
makedepends=('go')
optdepends=('chromium: to handle dynamically rendered web pages')
source=("https://github.com/MontFerret/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cc1e7d2f4daa07780513235b5480bb5f1f8b93a19e4700182b99aac9ec94832e')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go build \
    -gcflags "all=-trimpath=${srcdir}" \
    -asmflags "all=-trimpath=${srcdir}" \
    -ldflags "-X main.version=${pkgver}" \
    -o ferret ./
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 ferret "${pkgdir}/usr/bin/ferret"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CHANGELOG.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
