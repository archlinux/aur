# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.1.2
pkgrel=3
_rimever=0.9.3
pkgdesc="Fcitx Wrapper for librime"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.0' "librime>=$_rimever" "brise")
makedepends=('cmake' 'intltool')
install='fcitx-rime.install'
source=(
  "rime-$_rimever.tar.gz::https://github.com/lotem/brise/tarball/rime-$_rimever"
  "http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz"
)

_brise_name=lotem-brise-149c684

build() {
  cd "$srcdir"
  rm -rf brise/
  cp -r ${_brise_name}/ brise/

  msg "Starting make..."
  
  cd "$pkgname-$pkgver"

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

md5sums=('7a210167c0e5a474716a3bd1d553ff5a'
         '3b1d2ad3363910ed214672078c72e23f')
