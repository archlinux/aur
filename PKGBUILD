# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=bear-git
pkgver=r492.c3c3537
pkgrel=1
pkgdesc="Tool to generate compilation database for clang tooling"
arch=('i686' 'x86_64')
url="https://github.com/rizsotto/Bear"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'pkg-config')
depends=('python>=2.7')
conflicts=('bear')
provides=('bear')
source=("${pkgname}::git+https://github.com/rizsotto/Bear.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    .

  make all
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir/" install
}
