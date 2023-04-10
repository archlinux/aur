# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faac-git
pkgver=1.30.r6.g11215a2
pkgrel=2
pkgdesc="An MPEG-4 and MPEG-2 AAC encoder"
arch=('i686' 'x86_64')
url="https://faac.sourceforge.net/"
license=('GPL' 'BSD' 'custom')
depends=('glibc')
makedepends=('git')
provides=("faac=$pkgver")
conflicts=('faac')
source=("git+https://git.code.sf.net/p/faac/faac")
sha256sums=('SKIP')


pkgver() {
  cd "faac"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "faac"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "faac"

  make DESTDIR="$pkgdir" install

  install -Dm644 "README" -t "$pkgdir/usr/share/licenses/faac"
  install -Dm644 "libfaac/kiss_fft/COPYING" -t "$pkgdir/usr/share/licenses/faac"
}
