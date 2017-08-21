# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wavpack-git
pkgver=5.1.0.r12.g7ca841b
pkgrel=1
pkgdesc="An open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('wavpack')
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
  ./configure --prefix="/usr" --enable-tests
  make
}

check() {
  cd "WavPack/cli"

  #wvtest --default
}

package() {
  cd "WavPack"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/wavpack/COPYING"
}
