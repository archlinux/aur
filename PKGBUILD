# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=lisaem
pkgver=2.0.0
pkgrel=1
pkgdesc="Apple Lisa computer emulator"
arch=('x86_64')
url="https://github.com/arcanebyte/lisaem"
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('cd7dc4d1232c31756aa67155408d89a6c54fb75a0d3df3e4794f4286dd9297d35840761e200bcc8ee87110d09091da304174a2ff96fe71895d15c7299dabbc57')

prepare() {
  cd $pkgname-$pkgver
  sed -i "s|usr/local|usr|g" bashbuild/Linux.sys resources/lisaem.desktop
  sed -i "s/egrep/grep -E/g" build.sh bashbuild/src.build bashbuild/compilequeue.fn bashbuild/pre-atexit.fn
}

build() {
  cd $pkgname-$pkgver
  ./build.sh clean build
}

package() {
  cd $pkgname-$pkgver
  sed -i "s|\"/usr|\"$pkgdir/usr|g" bashbuild/Linux.sys
  ./build.sh install

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" \
                 "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
}
