# Maintainer: rootjdev <rootjdev@gmail.com>
pkgname=assemblyline-git
pkgver() {
  cd "${pkgname%-git}"
  version=$(grep AC_INIT <./configure.ac | awk -F'[\\[\\]]' '{print $4}')
  printf "${version}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | tr "-" "_"
}
pkgver=1.3.1_rc.2.r189.4c2223f
pkgrel=1
pkgdesc="An in-memory assembler for x86. (main branch)"
arch=(x86_64)
url="https://github.com/0xAde1a1de/assemblyline.git"
license=('Apache')
makedepends=(git autoconf automake libtool make)
checkdepends=(nasm)
provides=(libassemblyline asmline)
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd "${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr
  make clean all
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
