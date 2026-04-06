# Maintainer: Clansty <i@0w.al>

pkgname=moonlight-qt-qiin2333
pkgver=6.21.46
pkgrel=1
pkgdesc='GameStream client for PCs (qiin2333 fork with extra features)'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://github.com/qiin2333/moonlight-qt'
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'ffmpeg' 'sdl2_ttf' 'sdl2')
makedepends=('git' 'vulkan-headers')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs GMA 4500 (2008) up to Coffee Lake (2017)'
  'intel-media-driver: hardware acceleration for Intel GPUs starting from Broadwell (2014) and newer (e.g. Intel Arc)')
provides=('moonlight-qt')
conflicts=('moonlight-qt')
source=("git+https://github.com/qiin2333/moonlight-qt.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd moonlight-qt
  git submodule update --init --recursive
  qmake6 PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  cd moonlight-qt
  make release
}

package() {
  cd moonlight-qt
  make install
}
