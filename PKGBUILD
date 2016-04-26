# Maintainer: liara <liara at archlinux.info>

pkgname=fsmon-git
pkgver=1.1.r9.g6a26e39
pkgrel=1
pkgdesc="FileSystem Monitor utility."
arch=('i686' 'x86_64')
url="https://github.com/nowsecure/fsmon"
license=('MIT')
depends=('')
makedepends=('make' 'git')
source=("${pkgname}::git+https://github.com/nowsecure/fsmon.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
  install -Dm664 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
