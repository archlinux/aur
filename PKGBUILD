# Maintainer: rootjdev <rootjdev@gmail.com>
pkgname=assemblyline-git
pkgver() {
  cd "${pkgname%-git}"
  version=$(grep AC_INIT <./configure.ac | awk -F'[\\[\\]]' '{print $4}')
  printf "${version}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.0.0.r27.b4c948e
pkgrel=1
pkgdesc="An in-memory assembler for x86."
arch=(x86_64)
url="https://github.com/0xAde1a1de/assemblyline.git"
license=('Apache')
makedepends=(git autoconf automake libtool make)
checkdepends=(nasm)
provides=(libassemblyline asmline)
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
