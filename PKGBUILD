# Maintainer: Wellington <wellingtonwallace@gmail.com>

pkgname=fastgame-git
pkgver=0.2.0.r0.g6a53b7c
pkgrel=1
pkgdesc='Optimize system performance for games'
arch=(x86_64 i686)
url='https://github.com/wwmm/fastgame'
license=('GPL3')
depends=('boost-libs' 'gtk4' 'glib2' 'fmt' 'libsigc++-3.0')
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
  arch-meson fastgame build

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja install -C build
}
