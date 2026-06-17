pkgname=aurview
pkgver=0.4.1
pkgrel=1
pkgdesc="Read-only AUR/package metadata browser TUI"
arch=("x86_64" "aarch64")
url="https://github.com/kristyancarvalho/aurview"
license=("MIT")
makedepends=("go")
options=("!debug")
source=("${pkgname}_${pkgver}_source.tar.gz::https://github.com/kristyancarvalho/aurview/releases/download/v${pkgver}/${pkgname}_${pkgver}_source.tar.gz")
sha256sums=("fdd40868a4d5e82b7fa016bd80801a88e0064f470fdf4a8d21d395a6b4ee633c")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w -X main.version=${pkgver}" -o aurview ./cmd/aurview
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 aurview "${pkgdir}/usr/bin/aurview"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
