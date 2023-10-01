# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
# Contributor: SoftwareRat <jaguar5018@gmail.com>

pkgname=moonlight-qt-git
pkgver=v4.3.1.r252.gaa74e693
pkgrel=2
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux) (master branch)'
arch=('aarch64' 'x86_64')
license=('GPL')
url='https://moonlight-stream.org'
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf')
makedepends=('git' 'pkg-config')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://github.com/moonlight-stream/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install
}
