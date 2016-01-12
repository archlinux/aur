# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=faust-vst-git
pkgver=39.2cb1896
pkgrel=1
pkgdesc="VST plugin architecture for Faust"
arch=("i686" "x86_64")
license=('LGPL')
url="https://bitbucket.org/agraef/faust-vst/"
depends=('faust' 'boost' 'steinberg-vst36')
makedepends=()
source=("git+https://bitbucket.org/agraef/faust-vst")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/faust-vst
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/faust-vst
  make || return 1
}

package() {
  cd $srcdir/faust-vst
  make prefix=/usr DESTDIR=$pkgdir install install-faust || return 1
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README* "$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
