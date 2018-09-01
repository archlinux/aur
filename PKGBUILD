# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=0.3.0
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.com'
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=($pkgname::"git+https://github.com/moonlight-stream/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-.*//'
}

build() {
  cd "$pkgname"

  git checkout v${pkgver}
  git submodule update --init --recursive

  qmake PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$pkgname"
  make install
}
