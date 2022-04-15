# Maintainer: Katie Wolfe <wolfe@katie.host>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=fennel
pkgver=1.1.0
pkgrel=1
pkgdesc='A Lua Lisp language'
arch=('any')
url='https://fennel-lang.org'
license=('MIT')
depends=('lua')
makedepends=('git')
_commit='21c429235d49b2908c7e46442660b6f22da90efc'
source=("$pkgname::git+https://git.sr.ht/~technomancy/fennel#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  make build
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr MAN_DIR=/usr/share/man/man1 install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
