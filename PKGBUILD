# Maintainer: NebulaNeko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify
pkgver=0.9.0
pkgrel=2
pkgdesc="WebSockets support for any application/server"
license=('LGPL3')
arch=('any')
url="https://github.com/novnc/websockify"
makedepends=(python-setuptools)
depends=(python)
optdepends=('python-numpy: for better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novnc/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('d2251f653a40dc6dca0e5541845565d968c60be96a20a9b70b0305c4b7578f7fe205d4b98a94bb77d7c9383a396833af90fe92a6ade7e1a6f2d9bf8513d372c8')

prepare(){
  cd $pkgname-$pkgver
  sed -i '/numpy/d' setup.py
}
build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
