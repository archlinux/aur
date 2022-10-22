# Maintainer: Jiuyang Liu <liu@jiuyang.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator-git
_pkgname=verilator
pkgver=r5486.0e4da3b0b
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url='https://www.veripool.org/projects/verilator/wiki/Intro'
arch=('x86_64')
license=('LGPL')
depends=('perl')
optdepends=('systemc')
# lsb-release is used by configure script to enable usage of c++17
makedepends=('python' 'systemc' 'lsb-release' 'git')
conflicts=('verilator')
provides=('verilator')
source=(
  "verilator::git+https://github.com/verilator/verilator.git"
)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  autoconf
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir"
}
