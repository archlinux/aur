# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meh-git
pkgver=0.3.56.ga8da4f8
pkgrel=1
pkgdesc="A minimal image viewer using raw XLib."
arch=('i686' 'x86_64')
url="http://www.johnhawthorn.com/meh/"
license=('custom:MIT')
depends=('libxext' 'libjpeg' 'giflib' 'libpng')
makedepends=('git')
optdepends=('imagemagick')
conflicts=('meh')
_commit=a8da4f8a2f17e58a38777a37ddddbb1d1e941384
source=("git+https://github.com/andreasbaumann/meh.git#commit=$_commit")
md5sums=('SKIP')
_gitname=meh

pkgver () {
  cd "$srcdir/$_gitname"
  git describe --tags |sed s+-+.+g | cut -c2-
}

build() {
  cd $srcdir/$_gitname
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_gitname
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}



