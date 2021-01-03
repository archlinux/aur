# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux
pkgver=0.1.5
pkgrel=1
pkgdesc="A cross-platform soundboard in QtQuick"
arch=('any')
url="https://github.com/Soundux/Soundux"
license=('GPL3')
depends=('pulseaudio' 'qt5-base' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('qt5-tools' 'git' 'cmake' 'ninja')
conflicts=('soundux')
provides=('soundux')
source=("git+https://github.com/Soundux/Soundux#tag=$pkgver" "soundux.desktop")
sha256sums=('SKIP' '27e29e44ad3eacce0ac20a31653da437cd27cc2d165d19804430df9da7bab4fd')

build() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
  mkdir build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/Soundux/build/soundux" "${pkgdir}/usr/bin/soundux"
  # install icon
  install -Dm 664 "${srcdir}/Soundux/icon.png" "${pkgdir}/usr/share/pixmaps/soundux.png"
  # install desktop file
  install -Dm 644 "${srcdir}/soundux.desktop" "${pkgdir}/usr/share/applications/soundux.desktop"
}
