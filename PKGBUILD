# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='pavucontrol-qt'
pkgname="$_pkgname-sandsmark-git"
pkgver=0.3.0.316.g27c8a83
pkgrel=1
pkgdesc="Pulseaudio volume control, fork of lxqt's with bugfixes and extra features"
arch=('i686' 'x86_64')
url="https://github.com/sandsmark/$_pkgname"
license=('GPL2')
depends=('libpulse' 'qt5-base')
makedepends=('git' 'cmake')
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")
source=("git+https://github.com/sandsmark/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/./g"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
