# Maintainer: René Wagner < rwagner at rw-net dot de >

pkgname=mimalloc
pkgver=1.6.1
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
license=('MIT')
url='https://github.com/microsoft/mimalloc'
conflicts=('mimalloc-git')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('mimalloc')
_branch=master
source=("${_pkgname}::git+https://github.com/microsoft/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
