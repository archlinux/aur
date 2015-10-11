# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meh-git
pkgver=0.3.26.gce484db
pkgrel=2
pkgdesc="A minimal image viewer using raw XLib."
arch=('i686' 'x86_64')
url="http://www.johnhawthorn.com/meh/"
license=('custom:MIT')
depends=('libxext' 'libjpeg' 'giflib' 'libpng')
optdepends=('imagemagick')
conflicts=('meh')
source=('git+https://github.com/afarah1/meh.git' gif_main.patch)
md5sums=('SKIP' '38367b30851491dc818a2da365f55adc')
_gitname=meh

pkgver () {
  cd "$srcdir/$_gitname"
  git describe --tags |sed s+-+.+g | cut -c2-
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -Np1 < "$srcdir"/gif_main.patch
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


