# Maintainer: pgg <ppg.se3@gmail.com>

pkgname=how-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightweight AI assistant for your CLI — turns 'WTF do I type?' into commands"
arch=('x86_64')
url="https://github.com/patrykgruszka/how-cli"
license=('Unlicense')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4e91a954bfcda9bee82ddb1b1bf3071a6e617c96c04177c1595c83e3e14d7d0')

build() {
  cd "how-cli-${pkgver}"

  export CGO_ENABLED=0
  export GOFLAGS="-trimpath"
  local ldflags="-s -w"

  go build -buildmode=pie -ldflags "${ldflags}" -o how .
}

check() {
  cd "how-cli-${pkgver}"
  # No tests at the moment
  :
}

package() {
  cd "how-cli-${pkgver}"

  install -Dm755 how "${pkgdir}/usr/bin/how"

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # Documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
