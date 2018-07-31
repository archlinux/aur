# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=no-more-secrets-git
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool set to recreate the famous 'decrypting text' effect as seen in the 1992 movie Sneakers, aka nms."
url="https://github.com/bartobri/no-more-secrets"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ncurses')
makedepends=('git')
source=('git+https://github.com/bartobri/no-more-secrets.git')
md5sums=('SKIP')

_gitname="no-more-secrets"

pkgver() {
  cd $_gitname
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_gitname
  make all
}

package() {
  cd $_gitname/bin
  install -Dm755 sneakers "$pkgdir/usr/bin/sneakers"
  install -Dm755 nms      "$pkgdir/usr/bin/nms"
}

