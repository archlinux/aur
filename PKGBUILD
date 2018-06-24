# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=acarsserv-git
pkgver=r7.6ce3128
pkgrel=1
pkgdesc="Writes messages from acarsdec or vdlm2dec into sqlite database"
arch=('x86_64')
url="https://github.com/TLeconte/acarsserv"
license=('GPL')
depends=('sqlite')
makedepends=('git')
optdepends=('acarsdec: Source for messages')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/TLeconte/acarsserv.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make -f Makefile
}

package() {
  cd "$pkgname"
  install -Dm755 acarsserv "$pkgdir/usr/bin/acarsserv"
}
