pkgname=codeforce-tui
pkgver=0.2.2
pkgrel=1
pkgdesc='Terminal UI for Codeforces practice'
arch=('x86_64' 'aarch64')
url='https://github.com/simonwinther/codeforce-tui'
license=('unknown')
makedepends=('go')
provides=('cftui')
conflicts=('cftui')
options=('!debug')
optdepends=(
  'python: system Python for optional cloudscraper submit flow'
  'chromium: browser-backed auth and diagnostics'
  'firefox: browser cookie auth and user-agent detection'
)
source=("codeforce-tui-0.2.2.tar.gz::https://github.com/simonwinther/codeforce-tui/releases/download/v0.2.2/codeforce-tui-0.2.2.tar.gz")
sha256sums=('4d49c243ea29a0b43a7e9751aa6512c660f036c15adb5cce49e03af381474319')

_build_version='v0.2.2'
_build_commit='83e52f2'
_build_date='2026-06-06T03:45:54Z'

build() {
  cd "codeforce-tui-0.2.2"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-buildvcs=false -mod=readonly -trimpath"
  go build -ldflags "-X main.version=${_build_version} -X main.commit=${_build_commit} -X main.date=${_build_date}" -o "cftui" ./cmd/cftui
}

package() {
  cd "codeforce-tui-0.2.2"
  install -Dm755 "cftui" "${pkgdir}/usr/bin/cftui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
