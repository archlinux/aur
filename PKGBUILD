# Maintainer: toby <toby.bro+arch@pm.me>
# Contributor: Jiuyang Liu <liu@jiuyang.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator-git
_pkgname=verilator
pkgver=r8438.bbcb9315f
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url='https://www.veripool.org/projects/verilator/wiki/Intro'
arch=('x86_64')
license=('LGPL')
depends=('perl')
optdepends=(
    'ccache: to speed up compilation'
    'mold: to speed up linking'
    'numactl: to optimize memory access'
    'gperftools: for performance'
    'z3: optionnal solver for contraints support'
)
# lsb-release is used by configure script to enable usage of c++17
makedepends=('python' 'systemc' 'lsb-release' 'git' 'help2man' 'flex' 'autoconf')
checkdepends=('python-distro')
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
