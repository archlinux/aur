# Maintainer: fausty

pkgname=go2webp
_pkgname=go2webp
pkgver=1.3.0
pkgrel=1
pkgdesc='CLI tool for converting images and folders of images to WebP format'
url='https://codeberg.org/fausty/go2webp'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('glibc' 'libwebp')
makedepends=('go')
source=("https://codeberg.org/fausty/go2webp/archive/v${pkgver}.tar.gz")
sha256sums=('fc4a8d967f399e090fc65d048280bcf6f83f9ef09e39f34dd980f981172ea2f6')

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
