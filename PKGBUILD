# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Maxim Logaev <maximlogaev2001ezro@gmail.com>

_pkgname=zasm
pkgname="$_pkgname"-git
pkgver=4.5.0.r3.g3580ebb
pkgrel=1
pkgdesc="Z80/8080/Z180 assembler (bleeding edge)"
arch=('x86_64')
url="https://k1.spdns.de/Develop/Projects/zasm/Distributions/"
license=('BSD-2-Clause')
depends=('libstdc++' 'libgcc' 'glibc' 'zlib')
makedepends=('git')
provides=('zasm')
conflicts=('zasm')

source=("git+https://github.com/Megatokio/zasm#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  
  install -Dm755 zasm "$pkgdir"/usr/bin/zasm
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
