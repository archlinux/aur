# Contributor: m.reed art mykolab dart com
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xbanish-git
pkgver=1.5.r6.g0f2157c
pkgrel=1
pkgdesc="Banish the mouse cursor when typing, show it again when the mouse moves."
arch=('i686' 'x86_64')
url="https://github.com/jcs/xbanish"
license=('BSD')
depends=('libxfixes' 'libxi')
makedepends=('git')
conflicts=('xbanish')
provides=('xbanish')
source=("$pkgname::git+https://github.com/jcs/xbanish.git")
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
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}

