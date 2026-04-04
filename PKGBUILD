pkgname=cctui
pkgver=0.2.0
pkgrel=1
pkgdesc='Terminal UI tool to manage and switch Claude, Codex, and Gemini providers'
arch=('x86_64' 'aarch64')
url='https://github.com/manateelazycat/cctui'
license=('custom')
makedepends=('go')
source=('cctui-0.2.0.tar.gz::https://github.com/manateelazycat/cctui/archive/refs/tags/v0.2.0.tar.gz')
sha256sums=('96ab47b3b7112c86bc12d2a898b1d4fd69c95e259c3839caaf780e3d75d123db')

build() {
  cd "${srcdir}/cctui-0.2.0"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags='-s -w' -o cctui .
}

package() {
  cd "${srcdir}/cctui-0.2.0"
  install -Dm755 cctui "${pkgdir}/usr/bin/cctui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/cctui/README.md"
}
