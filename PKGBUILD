# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="davix-git"
pkgver="R_0_5_0.r84.g9ddbd23"
pkgrel="1"
pkgdesc="Davix aims to make the task of managing files over HTTP-based protocols simple."
arch=("x86_64" "i686")
url="http://dmc.web.cern.ch/projects/davix/home"
license=("LGPL")
depends=("boost" "libxml2" "openssl")
makedepends=("git" "cmake")
source=("git+https://github.com/cern-it-sdc-id/davix.git")
md5sums=("SKIP")

pkgver() {
  cd davix
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/davix"
  git submodule update --recursive --init
}

build() {
  cd "$srcdir/davix"

  [ ! -d build ] && mkdir build
  cd "$srcdir/davix/build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/davix/build"
  make DESTDIR="$pkgdir" install
}
