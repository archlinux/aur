# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
pkgname=plasma5-applets-playbar2-git
pkgver=2.5.r44.g8b66075
pkgrel=2
pkgdesc="Applet that shows now playing music"
arch=('i686' 'x86_64')
url="https://github.com/audoban/playbar2/"
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
makedepends=(
  git
  extra-cmake-modules
  kdoctools
)
provides=(${pkgname%-git})
conflicts=(
  ${pkgname%-git}
  kdeplasma-applets-playbar2
)
source=("${pkgname%-git}::git+https://github.com/audoban/playbar2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
