# Maintainer: Nico <desoxhd@gmail.com>
pkgname=soundux-git
pkgver=r61.6003b8d
pkgrel=1
pkgdesc="A universal soundboard in Qt for linux using pulseaudio modules"
arch=('any')
url="https://github.com/D3S0X/Soundux"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('qt5-tools' 'git' 'qpm-bin')
optdepends=('mpg123: mp3 support')
source=("git+https://github.com/D3S0X/Soundux.git" "soundux.desktop")
sha256sums=('SKIP' '489482294980db2352f754d1f26450daa545b39acd863a5b0069cea922944c60')

pkgver() {
  cd "${srcdir}/Soundux"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Soundux"
  qpm install
  mkdir build
  cd build
  qmake ..
  make
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/Soundux/build/Soundux" "${pkgdir}/usr/bin/Soundux"
  # install icon
  install -Dm 664 "${srcdir}/Soundux/icon.jpg" "${pkgdir}/usr/share/pixmaps/soundux-icon.jpg"
  # install desktop file
  install -Dm 644 "${srcdir}/soundux.desktop" "${pkgdir}/usr/share/applications/soundux.desktop"
}
