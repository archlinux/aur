# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zycore-c
pkgver=1.3.0
pkgrel=1
pkgdesc='Zyan Core Library for C'
arch=('x86_64')
url='https://github.com/zyantific/zycore-c'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
_commit='a754e112e80538612e1be165dfd05a746b12e042'
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
