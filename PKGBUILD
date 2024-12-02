# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.19.7
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL-2.0-or-later')
depends=('glibc' 'libbpf')
makedepends=('bpf' 'clang' 'llvm')
backup=('etc/sysconfig/stalld')
source=("https://gitlab.com/rt-linux-tools/stalld/-/archive/v$pkgver/stalld-v$pkgver.tar.gz")
sha256sums=('2e8680935ab812477257fe3c1ac3f9627b8e31ff3807c26cd6bf4e5885ba9998')


prepare() {
  cd "stalld-v$pkgver"

  sed -i 's|$(SOPTS)||;s|LDFLAGS	:=|LDFLAGS	:= $(LDFLAGS)|' "Makefile"
}

build() {
  cd "stalld-v$pkgver"

  make
}

package() {
  cd "stalld-v$pkgver"

  make DESTDIR="$pkgdir" install
}
