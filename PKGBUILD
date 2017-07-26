# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faac-git
pkgver=1.29.3.r3.gcc91e09
pkgrel=1
pkgdesc="An MPEG-4 and MPEG-2 AAC encoder"
arch=('i686' 'x86_64')
url="http://faac.sourceforge.net/"
license=('GPL' 'BSD' 'Custom')
depends=('glibc')
makedepends=('git')
provides=('faac')
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
  ./configure --prefix="/usr"
  make
}

package() {
  cd "faac"

  make DESTDIR="$pkgdir" install

  install -Dm644 "README" "$pkgdir/usr/share/licenses/faac/README"
  install -Dm644 "libfaac/kiss_fft/COPYING" "$pkgdir/usr/share/licenses/faac/COPYING"
}
