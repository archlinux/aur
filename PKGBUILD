# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wavpack-git
pkgver=5.5.0.r0.g89ef99e
pkgrel=1
pkgdesc="An open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=("wavpack=$pkgver")
conflicts=('wavpack')
options=('staticlibs')
source=("git+https://github.com/dbry/WavPack.git")
sha256sums=('SKIP')


pkgver() {
  cd "WavPack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "WavPack"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-tests
  make
}

check() {
  cd "WavPack/cli"

  #wvtest --default
}

package() {
  cd "WavPack"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/wavpack"
}
