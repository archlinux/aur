# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=diskmoose-git
pkgver=22e19f7
pkgrel=1
pkgdesc='Console application for warning users when they are running out of disk space'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/diskmoose'
license=('GPL2')
depends=('cowsay')
makedepends=('go')
provides=('diskmoose')
conflicts=('diskmoose')
source=("${pkgname%-git}::git://github.com/xyproto/diskmoose.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  go build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 diskmoose "$pkgdir/usr/bin/diskmoose"
  install -Dm 644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
