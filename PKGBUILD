pkgname=cftui
pkgver=0.2.1
pkgrel=1
pkgdesc='Terminal workflow for Codeforces practice and contests'
arch=('x86_64' 'aarch64')
url='https://github.com/simonwa01/codeforce-tui'
license=('unknown')
makedepends=('go')
options=('!debug')
optdepends=(
  'python: system Python for optional cloudscraper submit flow'
  'chromium: browser-backed auth and diagnostics'
  'firefox: browser cookie auth and user-agent detection'
)
source=("cftui-0.2.1.tar.gz::https://github.com/simonwa01/codeforce-tui/releases/download/v0.2.1/cftui-0.2.1.tar.gz")
sha256sums=('a3ae7f6e5ea8596b0bd7ead7e5d33329e0a895a90ca39ad35676b9e73274c6ad')

_build_version='v0.2.1'
_build_commit='eb5da02'
_build_date='2026-06-06T03:06:32Z'

build() {
  cd "cftui-0.2.1"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-buildvcs=false -mod=readonly -trimpath"
  go build -ldflags "-X main.version=${_build_version} -X main.commit=${_build_commit} -X main.date=${_build_date}" -o "${pkgname}" ./cmd/cftui
}

package() {
  cd "cftui-0.2.1"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
