# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=qbe
pkgver=r1258.ee6c272
pkgrel=1
pkgdesc="Small embeddable C compiler backend"
arch=('x86_64')
url="https://c9x.me/compile/"
license=('MIT')
depends=('glibc')
makedepends=('git')
_commit='ee6c272416c2f9c76318f3a396c83aa69689c773'
source=("git://c9x.me/qbe.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd qbe

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd qbe
  make
}

check() {
  cd qbe

  make -k check
}

package() {
  cd qbe

  make DESTDIR="$pkgdir" PREFIX=/usr install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
