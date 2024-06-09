# Maintainer: Gomasy <nyan@gomasy.jp>

_pkgname=sl
pkgname=erutaso
pkgver=r27.bd3a103
pkgrel=2
pkgdesc='Eru Chitanda runs across your terminal when you type "erutaso" as you meant to type "ls".'
arch=('i686' 'x86_64')
url="https://github.com/sgymtic/sl"
license=('custom')
depends=('ncurses')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  cc $CFLAGS -o erutaso sl.c -lcurses
  gzip -9 -f erutaso.1
}

package() {
  cd $_pkgname

  install -Dm 775 erutaso "$pkgdir/usr/bin/erutaso"
  install -Dm 644 erutaso.1.gz "$pkgdir/usr/share/man/man1/erutaso.1.gz"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
