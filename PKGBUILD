# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zycore-c
pkgver=1.4.1
pkgrel=1
pkgdesc='Zyan Core Library for C'
arch=('x86_64')
url='https://github.com/zyantific/zycore-c'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
_commit='1401fb85ac313f6605ec795c52bf99ea3f292a69'
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
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ZYCORE_BUILD_SHARED_LIB=ON
}

build() {
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
