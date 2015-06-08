# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=colorgrab
pkgver=0.2
pkgrel=4
pkgdesc="A cross-platform color picker."
url="https://github.com/Acolarh/colorgrab"
arch=('x86_64' 'i686')
license=('MIT')
depends=('wxgtk' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install="${pkgname}.install"
source=(
  "https://github.com/Acolarh/${pkgname}/archive/v${pkgver}.tar.gz"
  "colorgrab.desktop"
)
md5sums=(
  'e605fc21b411694a237d4ce0474539fb'
  '2c7b8b6e2aa43745ba5b1bd882bf5fac'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" colorgrab.desktop
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 img/scalable.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  for size in 16 32 48 64 128 256; do
    install -Dm644 "img/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
}


