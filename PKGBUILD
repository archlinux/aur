# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=speex-git
pkgver=1.2.1.r8.gf39602d
pkgrel=1
pkgdesc="An patent-free audio compression format designed for speech"
arch=('i686' 'x86_64')
url="https://www.speex.org/"
license=('BSD')
depends=('glibc' 'libogg' 'speexdsp')
makedepends=('git')
provides=("speex=$pkgver")
conflicts=('speex')
source=("git+https://gitlab.xiph.org/xiph/speex.git")
sha256sums=('SKIP')


pkgver() {
  cd "speex"

  git describe --long --tags | sed 's/^Speex.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "speex"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-binaries
  make
}

package() {
  cd "speex"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/speex"
}
