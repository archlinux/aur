# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux-git
pkgver=r70.8483485
pkgrel=3
epoch=1
pkgdesc="A cross-platform soundboard in QtQuick"
arch=('any')
url="https://github.com/Soundux/Soundux"
license=('GPL3')
depends=('pulseaudio' 'qt5-base' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('qt5-tools' 'git' 'cmake')
conflicts=('soundux')
provides=('soundux')
source=("git+https://github.com/Soundux/Soundux.git" "soundux.desktop")
sha256sums=('SKIP' '27e29e44ad3eacce0ac20a31653da437cd27cc2d165d19804430df9da7bab4fd')

pkgver() {
  cd "${srcdir}/Soundux"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/Soundux/build/soundux" "${pkgdir}/usr/bin/soundux"
  # install icon
  install -Dm 664 "${srcdir}/Soundux/icon.png" "${pkgdir}/usr/share/pixmaps/soundux.png"
  # install desktop file
  install -Dm 644 "${srcdir}/soundux.desktop" "${pkgdir}/usr/share/applications/soundux.desktop"
}
