pkgname=clio
pkgver=1.0.2
pkgrel=1
pkgdesc="A lightning-fast, keyboard-driven TUI for taking Markdown notes in the terminal. Powered by Go & Bubble Tea."
arch=('x86_64')
url="https://github.com/psychosomat/Clio"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/psychosomat/Clio/releases/download/v1.0.2/clio-1.0.2-source.tar.gz")
sha256sums=('a38aa2f2dd582e3f35ad656aaa6b75081a2e8d7d6f22655dcbffccd46cfc4d53')

build() {
  cd "${srcdir}/clio-${pkgver}"
  rm -f clio
  mkdir -p build
  go build -a -trimpath -ldflags="-s -w -X main.version=${pkgver}" -o build/clio ./cmd/clio
}

package() {
  cd "${srcdir}/clio-${pkgver}"
  install -Dm755 build/clio "${pkgdir}/usr/bin/clio"
}
