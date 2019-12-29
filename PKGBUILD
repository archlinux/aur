# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=1.2.1
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.org'
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf')
makedepends=('git')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=("git+https://github.com/moonlight-stream/${pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  cd "$pkgname"
  make release
}

package() {
  cd "$pkgname"
  make install
}
