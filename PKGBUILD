# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=supersonic-desktop
pkgver=0.1.0_beta
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers"
_pkgname="${pkgname//-desktop/}"
_pkgver="${pkgver//_/-}"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
depends=(
    'mpv'
)
provides=('supersonic-desktop')
makedepends=('go>=1.17')
source=(
    "${pkgname}-${_pkgver}.tar.gz::https://github.com/dweymouth/supersonic/archive/refs/tags/v${_pkgver}.tar.gz"
    "${pkgname}.desktop::https://raw.githubusercontent.com/dweymouth/supersonic/main/res/${pkgname}.desktop"
)
sha256sums=(
    '4baeea51f759c6571bb0e6450e3928838640bb9df80bded77cd8a15528c85163'
    '7a0d2cb03360b8165c68247c1e8dc2c4eb07f8713cdc93f1060c9ac9602d8a0b'
)

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/${_pkgname}-${_pkgver}"

  go build .
}

package() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
  _output="${srcdir}/${_pkgname}-${_pkgver}"

  install -Dm755 "${_output}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/${_pkgname}-${_pkgver}/res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
