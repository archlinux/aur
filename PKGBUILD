# $Id: PKGBUILD 270955 2016-07-05 10:45:42Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kqoauth
pkgver=0.98
pkgrel=1
pkgdesc="A library written in C++ for Qt that implements the OAuth 1.0 authentication specification RFC 5849"
arch=(i686 x86_64)
url='https://github.com/kypeli/kQOAuth'
license=(GPL)
depends=(qt5-base)
source=($pkgname-$pkgver.tar.gz::"https://github.com/kypeli/kQOAuth/archive/$pkgver.tar.gz")
sha1sums=('b029c54000f818e01db3fbea447ec94d24fa594f')

prepare() {
  mkdir -p build 
}

build() {
  cd build
  qmake ../kQOAuth-$pkgver
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
