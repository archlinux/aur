# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=bas-celik
pkgver=1.1.1
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
makedepends=('go>=1.17')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "bas-celik.desktop::https://dusanmitrovic.xyz/static/bas-celik.desktop"
)
sha256sums=(
    'fb26d1230471b039d1e413fee0047a92e2aa1964b6213e4cf0d5b5a17d34889f'
    '81c42dae6cefab23472421cd64c250e2fbf08546eed4901ca1742c48f31708ec'
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
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
