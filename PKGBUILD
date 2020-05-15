# Maintainer: Charles Brunet <charles AT cbrunet DOT net>

pkgname=webvfx
pkgdesc='Video effects engine based on web technologies'
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/mltframework/webvfx'
license=('BSD')
depends=('qt5-webkit' 'mlt')
makedepends=('qt5-tools')

source=("https://github.com/mltframework/webvfx/releases/download/$pkgver/$pkgname-$pkgver.txz")
md5sums=('b9625fbb29107a562190f696d6902c73')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  qmake .. \
    PREFIX='/usr'

  make
}

package() {
    cd $pkgname-$pkgver/build

    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
