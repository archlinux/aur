# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=colorgrab
pkgver=0.4.0_pre.2
_pkgver=0.4.0-pre.2
pkgrel=1
pkgdesc="A cross-platform color picker."
url="https://github.com/nielssp/colorgrab"
arch=('x86_64' 'i686')
license=('MIT')
depends=('wxwidgets-gtk3')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install="${pkgname}.install"
source=(
  "https://github.com/nielssp/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz"
)
md5sums=(
  '329003d55ad0ac5a1e46796fc04248e0'
)

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"
  cd "${pkgname}-${_pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 "pkg/arch/colorgrab.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 img/scalable.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  for size in 16 32 48 64 128 256; do
    install -Dm644 "img/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
}
