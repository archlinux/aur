# Maintainer: silentnoodle <silentnoodle at cock dot li>
pkgname=fxz-git
_pkgname=fxz
pkgver=1.1.0alpha.r94.gf12d7eb
pkgrel=1
pkgdesc="FXZ Utils is a fork of XZ Utils. It adds a multi-threaded radix match finder and optimized encode"
arch=("x86_64")
url="https://github.com/conor42/fxz"
license=('GPL' 'custom:xz')
groups=()
depends=(sh)
makedepends=(git autoconf)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('git+https://github.com/conor42/fxz#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
