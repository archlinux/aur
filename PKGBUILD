# Maintainer: Ckat <ckat@teknik.io>
pkgname="xbanish-timeout-git"
pkgver=1.5.r4.g0aa1e44
pkgrel=1
pkgdesc="Banish the mouse cursor when typing, show it again when the mouse moves. Patched fork with extra features such as timeout, ignorescroll"
arch=('i686' 'x86_64')
url="https://github.com/ckath/xbanish-timeout"
license=('BSD')
depends=('libxfixes' 'libxi')
makedepends=('git')
conflicts=('xbanish')
provides=('xbanish')
source=("$pkgname::git+https://github.com/ckath/xbanish-timeout.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 xbanish $pkgdir/usr/bin/xbanish
  install -Dm644 xbanish.1 $pkgdir/usr/share/man/man1/xbanish.1
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

