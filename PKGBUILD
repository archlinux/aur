# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.26.3
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
sha256sums=('1eeafe5ff47fa715b513f32cb082fa132037a3cc02db1078e00098362bb1b932')


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
