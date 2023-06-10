# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='ngs-lang-git'
pkgver=0.2.16.r1.g4dbdd65
pkgrel=1
epoch=1
pkgdesc='Next Generation Shell (NGS)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
license=('GPLv3')
makedepends=('cmake' 'git' 'pandoc' 'peg' 'uthash')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=('git+https://github.com/ngs-lang/ngs.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-lang-git}"

  git describe --tags | cut -c2- | sed 's+-+.r+' |tr - .
}

prepare() {
  cd "${pkgname/-lang-git}"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
}

build() {
  cd "${pkgname/-lang-git}/build"

  make
}

check() {
  cd "${pkgname/-lang-git}/build"

  ctest || true
}

package() {
  cd "${pkgname/-lang-git}/build"

  make install
}

# vim: ts=2 sw=2 et:
