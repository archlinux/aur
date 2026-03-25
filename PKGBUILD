pkgname=codex-sessions
pkgver=0.2.2
pkgrel=1
pkgdesc='Terminal UI for browsing and resuming Codex CLI sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/Uri2001/codex-sessions'
license=('MIT')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e41e98012615bfa4544aad8f9aabf9765155404f7a96414babfe9ef6707b4a94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags='-s -w' -o "${pkgname}" .
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
