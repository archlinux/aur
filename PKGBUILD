# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
pkgname=plasma5-applets-playbar2-git
pkgver=2.5.r1.g68f506e
pkgrel=1
pkgdesc="Applet that shows now playing music"
arch=('i686' 'x86_64')
url="https://github.com/audoban/PlayBar2/"
license=('GPL3')
depends=(
  plasma-framework
  plasma-workspace
  kdeclarative
  kglobalaccel
  kconfigwidgets
  kxmlgui
  kwindowsystem
)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(
  ${pkgname%-git}
  kdeplasma-applets-playbar2
)
source=("${pkgname%-git}::git+https://github.com/audoban/PlayBar2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
