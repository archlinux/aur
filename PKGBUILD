# Contributor: Andrew M Taylor <a.m.taylor303 at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=shuriken
pkgver=0.5.2
pkgrel=3
pkgdesc="An open source beat slicer"
url="https://rock-hopper.github.io/shuriken"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base' 'liblo' 'aubio' 'rubberband')
makedepends=('jack')
optdepends=('jack: A low-latency audio server')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rock-hopper/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/rock-hopper/$pkgname/raw/master/packaging/$pkgname.desktop"
        "https://github.com/rock-hopper/$pkgname/raw/master/packaging/$pkgname.png")
sha256sums=('4b9ce6cf73748aba4110d92593034054b324b6933456667eb641d956a630e1c6'
            '7345f4d5387df2fb1e2147cbe124a31247227d7a7bc07b3a6c1221f9a93dbfa2'
            'b637b82c35bb4f27eebe779c7790a85758e1b9c64fff8553ede207dda0d9cb37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/usr" install
  install -Dm644 ../${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../${pkgname}.png "$pkgdir/usr/share/icons/${pkgname}.png"
}
