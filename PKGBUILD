# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdvbpsi-git
pkgver=1.3.0.r226.gdfa10ba
pkgrel=2
pkgdesc="A library designed for decoding and generation of MPEG TS and DVB PSI tables according to standards ISO/IEC 13818 and ITU-T H.222.0"
arch=('i686' 'x86_64')
url="https://www.videolan.org/developers/libdvbpsi.html"
license=('LGPL2')
depends=('glibc')
makedepends=('git')
provides=('libdvbpsi')
conflicts=('libdvbpsi')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/libdvbpsi.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdvbpsi"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libdvbpsi"

  ./bootstrap
  ./configure --prefix="/usr" --enable-release
  make
}

package() {
  cd "libdvbpsi"

  make DESTDIR="$pkgdir" install
}
