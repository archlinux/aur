# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=termlite
pkgver=0.0.1
pkgrel=1
pkgdesc="TerminaLite - A lightweight and versatile terminal emulator for Linux and macOS built with GTK3 and VTE. Written in C."
arch=('x86_64')
url="https://github.com/felipealfonsog/TerminaLite"
license=('BSD-3-Clause')
depends=('gtk3' 'gcc' 'vte3' 'zsh')
source=("https://github.com/felipealfonsog/TerminaLite/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('659c0ee77d301233c4bbd9f9e625acfb29d06a0776ca146e0b14114883b32184')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

build() {
  cd "${srcdir}/TerminaLite-v.${pkgver}"
  gcc -o TerminaLite src/terminalite.c `pkg-config --cflags --libs gtk+-3.0 vte-2.91`

}

package() {
  cd "${srcdir}/TerminaLite-v.${pkgver}"

  # Install the binary to /usr/local/bin
  install -Dm755 TerminaLite "${pkgdir}/usr/local/bin/termlite"

  # Install the icon
  install -Dm644 "${srcdir}/TerminaLite-v.${pkgver}/src/termlite-icon.png" "${pkgdir}/usr/share/pixmaps/termlite.png"

  # Install the .desktop file
  install -Dm644 "${srcdir}/TerminaLite-v.${pkgver}/src/termlite.desktop" "${pkgdir}/usr/share/applications/termlite.desktop"
}


