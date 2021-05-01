# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alex Wiggins <alex.d.wiggins at gmail . com>

pkgname=penguin-subtitle-player
pkgver=1.4.0
pkgrel=1
pkgdesc='Standalone subtitle player'
arch=('x86_64')
url='https://github.com/carsonip/Penguin-Subtitle-Player'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('git')
source=("https://github.com/carsonip/Penguin-Subtitle-Player/archive/v$pkgver/Penguin-Subtitle-Player-$pkgver.tar.gz"
        '0001-Add-better-integration-for-Linux.patch')
sha256sums=('3be339dcf458d590c20a76fc1ff23fb046adf9bb0634c7fe0715b087a45f29e9'
            'ab5fb6371e4ed18b2e0309b02068a0606092f790ff9d324af7a2c3ebd80a714c')

prepare() {
  cd Penguin-Subtitle-Player-$pkgver
  git apply ../0001-Add-better-integration-for-Linux.patch
}

build() {
  cd Penguin-Subtitle-Player-$pkgver
  qmake-qt5 PREFIX=/usr PenguinSubtitlePlayer.pro
  make
}

package() {
  cd Penguin-Subtitle-Player-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
