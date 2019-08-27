# Maintainer: Wellington <wellingtonwallace@gmail.com>

pkgname=fastgame-git
pkgver=0.0.1.r0.g5d1da8a
pkgrel=2
pkgdesc='Optimize system performance for games'
arch=(x86_64 i686)
url='https://github.com/wwmm/fastgame'
license=('GPL3')
depends=('boost-libs')
makedepends=('meson' 'boost')
optdepends=('libxnvctrl: nvidia overclock')
source=("git+https://github.com/wwmm/fastgame.git")
conflicts=(fastgame)
provides=(fastgame)
sha512sums=('SKIP')

pkgver() {
  cd fastgame
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p fastgame/build
  cd fastgame/build

  arch-meson ..

  ninja
}

package() {
  cd fastgame/build

  DESTDIR="$pkgdir" ninja install
}