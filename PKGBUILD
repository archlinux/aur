# Maintainer: fausty

pkgname=go2webp
_pkgname=go2webp
pkgver=1.3.0
pkgrel=2
pkgdesc='CLI tool for converting images and folders of images to WebP format'
url='https://codeberg.org/fausty/go2webp'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('glibc' 'libwebp')
makedepends=('go')
source=("https://codeberg.org/fausty/go2webp/archive/v${pkgver}.tar.gz")
sha256sums=('ed31cf9c88ca8cfa0553ba34d75c02abb413151058b97b787ecc0635cc5b33b2')

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
