# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=0.20
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64)
url="https://github.com/windytan/redsea"
license=(MIT)
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp')
source=(
  "$pkgname-$pkgver.tar.gz"::https://github.com/windytan/$pkgname/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('fb0b9bf74a9bcc25c80ef3648b4bd0958862708a4a48dcf44f0a148bbd622fa4')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
