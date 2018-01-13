# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
_github_pkgname=playbar2
pkgname=plasma5-applets-playbar2
pkgver=2.5
pkgrel=5
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
makedepends=(
  extra-cmake-modules
  kdoctools
)
conflicts=(
  kdeplasma-applets-playbar2
)

source=("https://github.com/audoban/$_github_pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('964a29a07d7fab8f02d71224684e572e4fbadbd57fdc74ee6b59477b415306c39b60ec7be392711cfac8ab0325a72e7cee485e9c3af2949f439dbeb3a247605b')

prepare() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  mkdir -p build
}

build() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
