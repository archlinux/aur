# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=bas-celik
pkgver=2.0.0
pkgrel=1
pkgdesc="A desktop application for reading ID cards issued by the government of Serbia"
arch=('x86_64')
url="https://github.com/ubavic/bas-celik"
license=('MIT')
depends=(
    'glibc'
    'libglvnd'
    'libx11'
    'ccid'
    'opensc'
)
makedepends=('go>=1.20')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "435a7bb6bd4ef56c02fecf0c81e2109e5f5aef3fb7944af938d925e0c8e01849"
)

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/${pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  _output="${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/assets/application.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
