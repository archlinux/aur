pkgname=codeforces-tui
pkgver=0.2.3
pkgrel=1
pkgdesc='Terminal UI for Codeforces practice'
arch=('x86_64' 'aarch64')
url='https://github.com/simonwinther/codeforces-tui'
license=('unknown')
makedepends=('go')
provides=('cftui' 'codeforce-tui')
conflicts=('cftui' 'codeforce-tui')
options=('!debug')
optdepends=(
  'python: system Python for optional cloudscraper submit flow'
  'chromium: browser-backed auth and diagnostics'
  'firefox: browser cookie auth and user-agent detection'
)
source=("codeforces-tui-0.2.3.tar.gz::https://github.com/simonwinther/codeforces-tui/releases/download/v0.2.3/codeforces-tui-0.2.3.tar.gz")
sha256sums=('30f79fa9c0f2879149a6c004321c1391a79eff8cd31549dc060d4580d6b61dd9')

_build_version='v0.2.3'
_build_commit='22705c3'
_build_date='2026-06-06T04:13:30Z'

build() {
  cd "codeforces-tui-0.2.3"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-buildvcs=false -mod=readonly -trimpath"
  go build -ldflags "-X main.version=${_build_version} -X main.commit=${_build_commit} -X main.date=${_build_date}" -o "cftui" ./cmd/cftui
}

package() {
  cd "codeforces-tui-0.2.3"
  install -Dm755 "cftui" "${pkgdir}/usr/bin/cftui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
