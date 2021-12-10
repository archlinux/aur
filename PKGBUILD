# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.10.0
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL2')
depends=('glibc')
source=("https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-$pkgver.tar.gz")
sha256sums=('3057d401eda40b24dd1fa0ac253f51563260999f2109777e370d69519567cc5a')


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
