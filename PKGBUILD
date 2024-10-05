# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_commit=a3ee183cd3a5d65d3780eefbe75df4f98bca08c6

pkgname=lisaem
pkgver=RC5_2024.07.28
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Apple Lisa computer emulator"
arch=('x86_64')
url="https://github.com/arcanebyte/lisaem"
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/$_pkgver.tar.gz")
b2sums=('91349042cf3819aa9dff503ef9ccfbb16f133e664bbdfa9b317418787f81751ea62c76cc18053c528f4336781a119c8b2abe98d62caa9dcb75382358d4e9b67a')

prepare() {
  cd $pkgname-$_pkgver
  sed -i "s|usr/local|usr|g" bashbuild/Linux.sys resources/lisaem.desktop
  sed -i "s/egrep/grep -E/g" build.sh bashbuild/src.build bashbuild/compilequeue.fn bashbuild/pre-atexit.fn
}

build() {
  cd $pkgname-$_pkgver
  ./build.sh clean build
}

package() {
  cd $pkgname-$_pkgver
  sed -i "s|\"/usr|\"$pkgdir/usr|g" bashbuild/Linux.sys
  ./build.sh install

  install -Dm644 "$srcdir/$pkgname-$_pkgver/LICENSE.txt" \
                 "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
}
