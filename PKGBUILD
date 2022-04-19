# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=qbe
pkgver=r1252.2caa26e
pkgrel=1
pkgdesc="Small embeddable C compiler backend"
arch=('x86_64')
url="https://c9x.me/compile/"
license=('MIT')
depends=('glibc')
makedepends=('git')
_commit='2caa26e388b1c904d2f12fb09f84df7e761d8331'
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
