# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=profilex
pkgver=0.0.6
pkgrel=1
pkgdesc="ProFileX is a Linux file management tool with a GTK3-based GUI."
arch=('x86_64')
url="https://github.com/felipealfonsog/ProFileX"
license=('BSD-3-Clause')
depends=('gtk3' 'gcc')
source=("https://github.com/felipealfonsog/ProFileX/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('516d3b4777d2f95623c243afa9f919f7679c1ee3920ca0e085bb9eecd2ea1b80')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

build() {
  cd "${srcdir}/ProFileX-v.${pkgver}"
  gcc `pkg-config --cflags gtk+-3.0` -o profilex src/main.c src/file_manager.c `pkg-config --libs gtk+-3.0`

}

package() {
  cd "${srcdir}/ProFileX-v.${pkgver}"

  # Install the binary to /usr/local/bin
  install -Dm755 profilex "${pkgdir}/usr/local/bin/profilex"

  # Install the icon
  install -Dm644 "${srcdir}/ProFileX-v.${pkgver}/src/profilex-iconlogo.png" "${pkgdir}/usr/share/pixmaps/profilex.png"

  # Install the .desktop file
  install -Dm644 "${srcdir}/ProFileX-v.${pkgver}/src/profilex.desktop" "${pkgdir}/usr/share/applications/profilex.desktop"
}


