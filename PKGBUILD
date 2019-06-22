# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

_pkgname=mimalloc
pkgname=${_pkgname}-git
pkgver=r31.8a81a6c
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
license=('MIT')
url='https://github.com/microsoft/mimalloc'
depends=('glibc')
makedepends=('cmake')
provides=('libmimalloc.so=1.0')
_branch=master
source=("${_pkgname}::git+https://github.com/microsoft/${_pkgname}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
