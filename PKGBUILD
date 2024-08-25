# Maintainer: Peter Jung <ptr1337@cachyos.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libpfm
pkgver=4.13.0
pkgrel=2
pkgdesc='Library to encode performance events for use by perf tool'
arch=('x86_64')
url='https://perfmon2.sourceforge.net'
license=('MIT')
depends=(
  glibc
)
makedepends=(
  git
)
_commit='3d77461cb966259c51f3b3e322564187f4bef7fb'
source=("$pkgname::git+https://git.code.sf.net/p/perfmon2/libpfm4#commit=$_commit")
b2sums=('4380f7730c1bd7670688ddc5c7701c3c484c9934ba6f8fa9df2204c249376f2806c7cd0d3822616c5d56126b23a01ea3b45053ace8d411eabbc994745cd3d27f')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  make PREFIX=/usr
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

