# Contributor: Tinu Weber <http://ayekat.ch>

pkgname=ttylog
pkgver=0.29
pkgrel=1
arch=(x86_64)

pkgdesc='A serial port logger'
url='http://ttylog.sourceforge.net/'
license=(GPL2)

makedepends=(cmake)

source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        'bindir.patch')
md5sums=(1cefb8acc85b9d7daf211e2cf08ecc04
         b7316a7afe36d858cf4d6c47f05b0d2a)

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../bindir.patch
}

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
