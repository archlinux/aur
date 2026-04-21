# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.20.1
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://gitlab.com/rt-linux-tools/stalld"
license=('GPL-2.0-or-later')
depends=('glibc' 'libbpf')
makedepends=('bpf' 'clang' 'llvm')
optdepends=('bash: for throttlectl')
backup=('etc/sysconfig/stalld')
source=("https://gitlab.com/rt-linux-tools/stalld/-/archive/v$pkgver/stalld-v$pkgver.tar.gz")
sha256sums=('830f3f0ff7f00b23de43511639e9987839f730a2357746d938f3e20e0cff9fa0')


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
