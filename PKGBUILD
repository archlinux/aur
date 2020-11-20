# Maintainer: base64 --decode <<< Q8OpZHJpYyBDb25uZXMgPGNlZHJpYy5jb25uZXNAZ21haWwuY29tPgo=

pkgname=switch-lan-play
pkgver=0.2.3
pkgrel=1
pkgdesc='Make you and your friends play games like in a LAN'
arch=('i686' 'x86_64')
url='https://github.com/spacemeowx2/switch-lan-play'
license=('GPL3')
depends=('libpcap')
makedepends=('cmake')
source=("git+https://github.com/spacemeowx2/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname"
  cd build
  make DESTDIR="$pkgdir/" install
}
