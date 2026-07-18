# Maintainer: Zaid Ejjo <zaid@example.com>
# Contributor: Zaid Ejjo <zaid@example.com>

pkgname=ax
pkgver=0.1.1
pkgrel=1
pkgdesc="ax — TUI API Client: a terminal-based HTTP client with xh/httpie-style syntax parsing"
arch=('x86_64' 'aarch64')
url="https://github.com/zaidejjo/ax"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('ax')
conflicts=('ax')
optdepends=('xclip: X11 clipboard support'
  'wl-clipboard: Wayland clipboard support')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "ax-$pkgver"
  mkdir -p build
}

build() {
  cd "ax-$pkgver"
  export CGO_ENABLED=0
  # تأكد من مسار ملف الـ main.go في مشروعك، إذا كان بجذر المشروع غيره لـ . فقط
  go build -o build/ax -ldflags="-s -w" ./cmd/ax/main.go
}

package() {
  cd "ax-$pkgver"

  install -Dm755 build/ax "${pkgdir}/usr/bin/ax"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
