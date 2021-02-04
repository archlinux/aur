# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=systemd-plasmoid-git
pkgver=2.0.1_r28.g7d0c7d7
pkgrel=1
pkgdesc="A plasma widget to control systemd services"
arch=($CARCH)
url="https://github.com/jansenm/systemd-plasmoid"
license=(LGPL)
depends=(qt5-declarative)
makedepends=(extra-cmake-modules-git ki18n-git knotifications-git plasma-framework-git qt5-base)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
