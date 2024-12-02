# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.19.1
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL-2.0-or-later')
depends=('glibc' 'libbpf')
makedepends=('bpf' 'clang' 'llvm')
source=("https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-$pkgver.tar.gz")
sha256sums=('44f90b935080835b017a6cca6fa8ba8336b66fe2f799495b64a4a92f24f61d59')


prepare() {
  cd "stalld-$pkgver"

  sed -i 's|$(SOPTS)||;s|LDFLAGS	:=|LDFLAGS	:= $(LDFLAGS)|' "Makefile"
}

build() {
  cd "stalld-$pkgver"

  make
}

package() {
  cd "stalld-$pkgver"

  make DESTDIR="$pkgdir" install
}
