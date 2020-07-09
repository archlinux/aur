# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alex Wiggins <alex.d.wiggins at gmail . com>

pkgname=penguin-subtitle-player
pkgver=1.3.1
pkgrel=1
pkgdesc="Standalone subtitle player"
arch=(x86_64)
url="https://github.com/carsonip/Penguin-Subtitle-Player"
license=(GPL3)
depends=(hicolor-icon-theme qt5-base)
makedepends=(git)
source=(https://github.com/carsonip/Penguin-Subtitle-Player/archive/v$pkgver/Penguin-Subtitle-Player-$pkgver.tar.gz
        0001-Add-better-integration-for-Linux.patch)
sha256sums=('f0a00555142b405ff1fcac696e04049b757387665f211282987fd6b8a1aca264'
            'ab5fb6371e4ed18b2e0309b02068a0606092f790ff9d324af7a2c3ebd80a714c')

prepare() {
  cd Penguin-Subtitle-Player-$pkgver
  git apply ../0001-Add-better-integration-for-Linux.patch
}

build() {
  cd Penguin-Subtitle-Player-$pkgver
  qmake PREFIX=/usr PenguinSubtitlePlayer.pro
  make
}

package() {
  cd Penguin-Subtitle-Player-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
