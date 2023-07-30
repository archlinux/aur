# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=retroforth
pkgver=2023.3
pkgrel=1
pkgdesc='A modern, pragmatic Forth'
arch=('x86_64')
url='https://retroforth.org/'
license=('ISC')
depends=('glibc' 'bash')
makedepends=('git')
_commit='2818f20a5a7cf291b9ef4f8b1f9688c4e4c16fb0'
source=("$pkgname::git+https://git.sr.ht/~crc_/retroforth#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  PREFIX=/usr DESTDIR="$pkgdir" make install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
