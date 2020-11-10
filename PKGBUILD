# Maintainer: Wellington <wellingtonwallace@gmail.com>

pkgname=fastgame-git
pkgver=0.0.9.r53.g43786aa
pkgrel=1
pkgdesc='Optimize system performance for games'
arch=(x86_64 i686)
url='https://github.com/wwmm/fastgame'
license=('GPL3')
depends=('boost-libs' 'gtk3' 'gtkmm3' 'glibmm' 'libsigc++')
makedepends=('meson' 'boost' 'itstool')
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
