# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libzen-git
pkgver=0.4.37.r12.g49019a7
pkgrel=1
pkgdesc="Shared library for libmediainfo"
arch=('i686' 'x86_64')
url="https://github.com/MediaArea/ZenLib"
license=('BSD')
depends=('gcc-libs')
makedepends=('git')
provides=('libzen')
conflicts=('libzen')
source=("git+https://github.com/MediaArea/ZenLib.git")
sha256sums=('SKIP')


pkgver() {
  cd "ZenLib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ZenLib/Project/GNU/Library"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "ZenLib"

  pushd "Project/GNU/Library"
  make DESTDIR="$pkgdir" install

  popd
  install -Dm644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
