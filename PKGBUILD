# Maintainer:  Geoffrey Casper <gcasper42@gmail.com>
# Contributor: Swift Geek
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Mateusz Paluszkiewicz <aifam96 at gmail dot com> # Other hacks for repo's target, qt5-wayland-dev-git package
# TODO: more hacks
# TODO: better pkgver()
# TODO: add prepare()

_pkgname=qt5-wayland
pkgname=$_pkgname-bugfixport-git
pkgver=5.15.2[e3879c17]
pkgrel=2
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=("i686" "x86_64")
url="https://github.com/Geo25rey/qt5-wayland.git"
license=("GPL3" "LGPL")
depends=("qt5-declarative" "libxcomposite" "wayland")
makedepends=("git" "vulkan-headers")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/Geo25rey/qt5-wayland.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "5.15.2[$(git rev-parse --short HEAD)]"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Replace Qt version to user version (Qt)
  if [ -d ./build ]; then
    rm -rf --one-file-system ./build
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  export QT_SELECT=5
  qmake CONFIG+=wayland-compositor ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install
}
