pkgname=tcplay-veracrypt
pkgver=2.0
pkgrel=1
pkgdesc="Free and simple TrueCrypt implementation based on dm-crypt."
arch=('i686' 'x86_64')
url="https://github.com/veracrypt/tc-play"
license=('BSD-2-Clause')
depends=('device-mapper')
makedepends=('cmake')
provides=('tcplay')
conflicts=('tcplay')
replaces=('tcplay')
source=("git+https://github.com/veracrypt/tc-play.git")

sha256sums=('SKIP')

prepare() {
  cd "tc-play"
  patch -Np1 -i ../../1.patch
  patch -Np1 -i ../../2.patch
}

build() {
  cd "tc-play"
  mkdir -p objdir
  cd objdir
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "tc-play/objdir"
  make DESTDIR="$pkgdir" install
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/tcplay/LICENSE
}