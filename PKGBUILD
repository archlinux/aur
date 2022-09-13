# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zycore-c
pkgver=1.2.0
pkgrel=1
pkgdesc='Zyan Core Library for C'
arch=('x86_64')
url='https://github.com/zyantific/zycore-c'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
_commit='bdbd3ff40a36a88595c2a2895bf300d5c1e7d972'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZYCORE_BUILD_SHARED_LIB=ON
}

build() {
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
