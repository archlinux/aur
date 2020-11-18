# Contributor: mewmew <rnd0x00@gmail.com>
# Contributor: Robin Eklind <rnd0x00@gmail.com>
# Maintainer: Benjamin Levy <blevy@protonmail.com>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=retdec-git
pkgver=v4.0.r254.g6b674df8
pkgrel=1
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('i686' 'x86_64')
url="https://retdec.com/"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('git' 'cmake')
optdepends=('upx' 'graphviz')
provides=('retdec')
conflicts=('retdec')
source=("$pkgname::git+https://github.com/avast/retdec.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make install
  cd "$srcdir/$pkgname"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
