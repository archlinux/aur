# Maintainer: Simon Scatton <simon.scatton@outlook.fr>

pkgname=isolate-lib
pkgver=1.8.2
pkgrel=1
pkgdesc="Dynamic library based on the isolate program for the IOI"
arch=('any')
url="https://github.com/moulinex-app/isolate"
license=('GPL2')
depends=()
makedepends=('git' 'gcc' 'libcap')
provides=('isolate-lib')
conflicts=('isolate' 'isolate-git')
source=("https://github.com/moulinex-app/isolate/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=("a25aef5b4161b26fd92ff3ca5ba3a40039a60da43fa83338a95382eafb7bb79d19474a958eba1b881e352d3e3fa8c91e92eb4328917389c21e11f27790c01473")

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix="/usr"
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
  mkdir $pkgdir/usr/lib/pkgconfig
  cp isolate.pc $pkgdir/usr/lib/pkgconfig/isolate.pc
}
