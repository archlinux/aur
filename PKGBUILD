# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.18.0
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('bpf' 'clang')
source=("https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-$pkgver.tar.gz")
sha256sums=('7f2953cd4cbe48ac5fe8e1b82fd94f874e6332a187a3f36b2d0f054eafcdb5ca')


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
  install -Dm644 "redhat/stalld.service" -t "$pkgdir/usr/lib/systemd/system"
}
