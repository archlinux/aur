# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.19.8
pkgrel=2
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://gitlab.com/rt-linux-tools/stalld"
license=('GPL-2.0-or-later')
depends=('glibc' 'libbpf')
makedepends=('bpf' 'clang' 'llvm')
optdepends=('bash: for throttlectl')
backup=('etc/sysconfig/stalld')
source=("https://gitlab.com/rt-linux-tools/stalld/-/archive/v$pkgver/stalld-v$pkgver.tar.gz")
sha256sums=('be84f4c9560e77807c8b45e5ddbb9d02d80c591c6224d3c2b16525ce834c79a7')


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
