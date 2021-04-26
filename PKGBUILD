# Maintainer: Martin Brodbeck <martin at brodbeck-online dot de>
pkgname=bibellese
pkgver=1.9.1
pkgrel=1
pkgdesc="Helps with reading the bible according to various reading plans (German only)"
arch=('i686' 'x86_64')
url="http://git.rustysoft.de/martin/bibellese"
license=('custom')
depends=('glibc' 'libical' 'qt5-base')
makedepends=('boost>=1.47')
source=("$pkgname-$pkgver.tar.gz::https://git.rustysoft.de/martin/bibellese/archive/v$pkgver.tar.gz")
sha256sums=('d380397cd600811c09aca735ecc67adb4edf32cb636fbcaf7f55c7863e743c65')

build() {
  if [ ! -d bibellese/build ]; then
    mkdir bibellese/build
  fi
  cd bibellese/build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
  make
}

package() {
  mkdir -p $pkgdir/usr/share/bibellese/data
  cd bibellese/build
  make install
  cd ..
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
