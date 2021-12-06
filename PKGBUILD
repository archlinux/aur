# Maintainer: BlindingDark <blindingdark@outlook.com>

pkgname=tgs2png-git
_pkgname=tgs2png
pkgver=69e3605
pkgrel=1
pkgdesc="Convert Telegram's animated stickers in TGS format into series of PNG images."
url="https://github.com/zevlg/tgs2png"
depends=(libpng rlottie)
makedepends=(git cmake)
arch=(x86_64)
license=(GPL3)
provides=(tgs2png)
conflicts=(tgs2png)
source=("git+https://github.com/zevlg/tgs2png")
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "$_pkgname/build"

  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
