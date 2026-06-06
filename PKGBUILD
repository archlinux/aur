# Maintainer: fausty

pkgname=go2webp
_pkgname=go2webp
pkgver=1.1.0
pkgrel=1
pkgdesc='CLI tool for converting images and folders of images to WebP format'
url='https://codeberg.org/fausty/go2webp'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=()
makedepends=('go')
source=("https://codeberg.org/fausty/go2webp/archive/v${pkgver}.tar.gz")
sha256sums=('89eee8764d9759d08cb4ee40f2502e298bff802c2b0a9c3c5559c265df8dc44a')

build() {
  cd go2webp

  export CGO_ENABLED=1

  go build \
    -trimpath \
    -ldflags="-X main.AppVersion=${pkgver} -s -w" \
    -o "${_pkgname}" .
}



package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
