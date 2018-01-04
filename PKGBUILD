# Maintainer:
# Contributor: Tom van der Lee <t0m.vd.l33@gmail.com>

pkgname=bir
pkgver=2.0
pkgrel=2
pkgdesc="Simple graphical batch image resizer"
arch=('i686' 'x86_64')
url="https://github.com/agronick/BIR"
license=('custom:WTFPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/agronick/BIR/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/agronick/BIR/master/LICENSE")
sha256sums=('e17bd1239343863006fa830bce229046c75512e66d51c529bda00cdf8c76e341'
            '40f2791ae84e097cc964b740cbd974e78296a36aa1490dcb76dcc004bf865ac8')

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../BIR-$pkgver
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../BIR-$pkgver/bir.png "$pkgdir"/usr/share/pixmaps/bir.png
  install -Dm644 ../BIR-$pkgver/bir.desktop "$pkgdir"/usr/share/applications/bir.desktop
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
