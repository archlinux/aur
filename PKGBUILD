pkgname=codeforces-tui
pkgver=0.2.2
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
source=("codeforces-tui-0.2.2.tar.gz::https://github.com/simonwinther/codeforces-tui/releases/download/v0.2.2/codeforces-tui-0.2.2.tar.gz")
sha256sums=('100259f539ac61d0e2bd6c4f5fa681453657a96079aa961e8542ccbd2cc5ad2c')

_build_version='v0.2.2'
_build_commit='local'
_build_date='2026-06-06T00:00:00Z'

build() {
  cd "codeforces-tui-0.2.2"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-buildvcs=false -mod=readonly -trimpath"
  go build -ldflags "-X main.version=${_build_version} -X main.commit=${_build_commit} -X main.date=${_build_date}" -o "cftui" ./cmd/cftui
}

package() {
  cd "codeforces-tui-0.2.2"
  install -Dm755 "cftui" "${pkgdir}/usr/bin/cftui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
