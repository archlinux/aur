# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=supersonic-desktop
pkgver=0.1.0
pkgrel=2
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers"
_pkgname="${pkgname//-desktop/}"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
depends=(
    'mpv'
)
provides=('supersonic-desktop')
makedepends=('go>=1.17')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/dweymouth/supersonic/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '9c5167aa43ff516dc6dda8e8b08872bc4bf49c39431c24f0500c10b843c2b9bc'
)

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/${_pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw .
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  _output="${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "${_output}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
