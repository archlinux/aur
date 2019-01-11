# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
pkgname=sqawk-git
epoch=1
pkgver=r184.658b628
pkgrel=1
pkgdesc="Like Awk but with SQL and table joins"
url="https://github.com/dbohdan/sqawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('sqlite-tcl' 'tcl' 'tcllib')
makedepends=('git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  make
}

check() {
  cd ${pkgname%-git}
  make test
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/${pkgname%-git}"
  make prefix=/usr DESTDIR="$pkgdir" install
}
