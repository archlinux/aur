# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Gy�rgy Ball�
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xv
pkgver=4.1.1
pkgrel=1
_xvver=3.10a
pkgdesc='A nice image viewer'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/jasper-software/xv'
license=(custom)
depends=('libpng' 'libx11' 'libtiff' 'jasper')
makedepends=('cmake' 'libxt')
options=(!emptydirs)
source=(https://github.com/jasper-software/xv/releases/download/v$pkgver/$pkgname-$_xvver-js-$pkgver.tar.gz
        license.txt)
sha1sums=('2c9b7108bcd6ff97dfe1cd5f31f024a445cbe860'
          '4561344e8f2c30eee9c55b14a14f062d89d6e7b7')

prepare() {
  cd "$pkgname-$_xvver-js-$pkgver"
  cmake -H. -Btmp_cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_SYSCONFDIR="$pkgdir/etc" \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "$pkgname-$_xvver-js-$pkgver"
  cmake --build tmp_cmake
}

package() {
  cd "$pkgname-$_xvver-js-$pkgver"
  cmake --build tmp_cmake --target install
  install -D -m644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"

# installing source tarball (to comply with license)
  install -D -m644 "$srcdir/$pkgname-$_xvver-js-$pkgver.tar.gz" "$pkgdir/usr/share/doc/xv/xv-$pkgver-source.tar.gz"
  ln -s "/usr/share/licenses/$pkgname/license.txt" "$pkgdir/usr/share/doc/xv/license.txt"
}
