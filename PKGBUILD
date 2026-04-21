# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.25.1
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
sha256sums=('cea9057b2ce607dc17c3ea3cd51abc3c89154acfac100a529c0048947395647c')


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
