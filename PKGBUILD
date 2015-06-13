# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=waffles
pkgver=2013.04.06
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="Comprehensive collection of CLI tools for machine learning and data mining."
arch=('i686' 'x86_64')
url="http://waffles.sourceforge.net/"
license=('LGPL')
depends=('libpng' 'gcc-libs')
source=(http://downloads.sourceforge.net/project/waffles/waffles/$_pkgver/waffles-$_pkgver-source.zip)
md5sums=('1f0db8fb278014dcca3fdf90a1b6022c')

build() {
  cd "$srcdir/$pkgname/src"
  make opt

  # make test
  #cd "$srcdir/$pkgname/bin"
  #./test

  # make docs
  cd "$srcdir/$pkgname/web"
  find ./ -type f -exec chmod -x {} +
  find ./ -type f -name '*.bash' -exec chmod +x {} +
}

package() {
  cd "$srcdir/$pkgname"
  # makefile does not seem to take any useful args

  # binaries
  install -d "$pkgdir/usr/bin/"
  install -t "$pkgdir/usr/bin/" bin/waffles_*

  # docs
  install -d "$pkgdir/usr/share/doc/waffles"
  cp -r web/* "$pkgdir/usr/share/doc/waffles"
}
