pkgname=cctui
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal UI tool to manage and switch Claude, Codex, and Gemini providers'
arch=('x86_64' 'aarch64')
url='https://github.com/manateelazycat/cctui'
license=('custom')
makedepends=('go')
source=('cctui-0.1.0.tar.gz::https://github.com/manateelazycat/cctui/archive/refs/tags/v0.1.0.tar.gz')
sha256sums=('9f63d8e87757039b4d34212da107e819c1f3617d73156a18379e27f9ddee027a')

build() {
  cd "${srcdir}/cctui-0.1.0"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags='-s -w' -o cctui .
}

package() {
  cd "${srcdir}/cctui-0.1.0"
  install -Dm755 cctui "${pkgdir}/usr/bin/cctui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/cctui/README.md"
}
