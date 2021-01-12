# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=colorgrab
pkgver=0.3
pkgrel=2
pkgdesc="A cross-platform color picker."
url="https://github.com/nielssp/colorgrab"
arch=('x86_64' 'i686')
license=('MIT')
depends=('wxgtk2' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install="${pkgname}.install"
source=(
  "https://github.com/nielssp/${pkgname}/archive/v${pkgver}.tar.gz"
)
md5sums=(
  'd1db6f37cd4a4f0cf1878d3cb76ef216'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" "pkg/arch/colorgrab.desktop"
  install -Dm644 img/scalable.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  for size in 16 32 48 64 128 256; do
    install -Dm644 "img/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
}


