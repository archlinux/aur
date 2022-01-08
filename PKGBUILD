# Maintainer: Claudio Ebel <my dot pvt dot emailaddress at gmail dot com>
pkgname=gsl-lite
pkgver=0.40.0.r1.g4b5e9ab
pkgrel=1
pkgdesc="Guidelines Support Library for C++98, C++11 up"
arch=('any')
url="https://github.com/gsl-lite/gsl-lite"
license=('MIT')
makedepends=('cmake' 'git')
source=("git+https://github.com/gsl-lite/gsl-lite.git#commit=4b5e9ab")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cmake -S $pkgname -B build -DCMAKE_INSTALL_PREFIX=/usr
  DESTDIR="$pkgdir" cmake --install build
  cd $pkgname
  install -D -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
