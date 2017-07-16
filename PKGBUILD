# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-backgroundprocess
pkgver=1.5.1
pkgrel=3
pkgdesc="A Library to create background applications with simple, automated foreground control"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtBackgroundProcess"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtBackgroundProcess.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
