# Maintainer: Wellington <wellingtonwallace@gmail.com>

pkgname=fastgame-git
pkgver=1.0.0.r0.g33d7979
pkgrel=1
pkgdesc='Optimize system performance for games'
arch=(x86_64 i686)
url='https://github.com/wwmm/fastgame'
license=('GPL3')
depends=('boost-libs' 'kirigami' 'kirigami-addons' 'kconfigwidgets' 'qqc2-desktop-style' 'breeze-icons' 'qt6-base')
makedepends=('boost' 'cmake' 'extra-cmake-modules' 'git' 'ninja' 'intltool' 'appstream-glib')
optdepends=('libxnvctrl' 'libx11')
source=("git+https://github.com/wwmm/fastgame.git")
conflicts=(fastgame)
provides=(fastgame)
sha512sums=('SKIP')

pkgver() {
  cd fastgame
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build  \
    -S fastgame \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
