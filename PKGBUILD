# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meh-git
pkgver=0.3.58.g8a89769
pkgrel=2
pkgdesc="A minimal image viewer using raw XLib."
arch=('i686' 'x86_64' 'pentium4')
url="http://www.johnhawthorn.com/meh/"
license=('custom:MIT')
depends=('libxext' 'libjpeg-turbo' 'giflib' 'libpng')
makedepends=('git')
optdepends=('imagemagick')
conflicts=('meh')
_commit=8a897699a709bc1c8febbc5d936fb720fc04726d
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



