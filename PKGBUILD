# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alex Wiggins <alex.d.wiggins at gmail . com>

pkgname=penguin-subtitle-player
pkgver=1.6.0
pkgrel=1
pkgdesc='Standalone subtitle player'
arch=('x86_64')
url='https://github.com/carsonip/Penguin-Subtitle-Player'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base' 'uchardet')
source=("https://github.com/carsonip/Penguin-Subtitle-Player/archive/v${pkgver}/$pkgname-$pkgver.tar.gz")
sha256sums=('fdc34d234c7f632ec2ebbf84af9aefac6ea504bb5de7323c63cfaa0acf095b06')

prepare() {
  cd Penguin-Subtitle-Player-$pkgver

  # Unbundle uchardet
  sed -i '/src\/uchardet/d' PenguinSubtitlePlayer.pro
  sed -i 's|uchardet/src/uchardet.h|uchardet/uchardet.h|' src/chardet.cpp
}

build() {
  cd Penguin-Subtitle-Player-$pkgver
  qmake-qt5 PREFIX=/usr PenguinSubtitlePlayer.pro LIBS+=" -luchardet"
  make
}

package() {
  cd Penguin-Subtitle-Player-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
