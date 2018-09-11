# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt-git
pkgver=r301.2fdfb3e
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux) (master branch)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.com'
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg')
makedepends=('git')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://github.com/moonlight-stream/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  qmake PREFIX="$pkgdir/usr"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install
}
