# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faad2-git
pkgver=2.11.2.r5.gf2f4e8e
pkgrel=1
pkgdesc="Freeware Advanced Audio (AAC) Decoder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/faac/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("faad2=$pkgver" libfaad{,_drm}.so)
conflicts=('faad2')
source=("git+https://github.com/knik0/faad2.git")
sha256sums=('SKIP')


pkgver() {
  cd "faad2"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "faad2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "faad2"

  DESTDIR="$pkgdir" cmake --install "_build"
}
