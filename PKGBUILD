# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_commit=a3ee183cd3a5d65d3780eefbe75df4f98bca08c6

pkgname=lisaem
pkgver=1.2.7_RC4
pkgrel=1
pkgdesc="Apple Lisa computer emulator"
arch=('x86_64')
url="https://lisa.sunder.net/"
license=('GPL')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("git+https://github.com/rayarachelian/lisaem.git#commit=$_commit")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  sed -i "s|usr/local|usr|g" bashbuild/Linux.sys resources/lisaem.desktop
  sed -i "s/egrep/grep -E/g" build.sh bashbuild/src.build bashbuild/compilequeue.fn bashbuild/pre-atexit.fn
}

build() {
  cd $pkgname
  ./build.sh clean build
}

package() {
  cd $pkgname
  sed -i "s|\"/usr|\"$pkgdir/usr|g" bashbuild/Linux.sys
  ./build.sh install

  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" \
                 "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
}
