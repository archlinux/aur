# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libpfm
pkgver=4.13.0
pkgrel=1
pkgdesc='Library to encode performance events for use by perf tool'
arch=('x86_64')
url='https://perfmon2.sourceforge.net'
license=('MIT')
depends=('glibc')
makedepends=('git')
_commit='3d77461cb966259c51f3b3e322564187f4bef7fb'
source=("$pkgname::git+https://git.code.sf.net/p/perfmon2/libpfm4#commit=$_commit")
b2sums=('SKIP')

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

