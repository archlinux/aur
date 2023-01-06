# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify
pkgver=0.10.0
pkgrel=1
pkgdesc="WebSockets support for any application/server"
license=('LGPL3')
arch=('any')
url="https://github.com/novnc/websockify"
makedepends=(python-setuptools)
depends=(python)
optdepends=('python-numpy: for better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novnc/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('262071f4858e5e3b6471c6f3731d8715c5c13fcc5f43738a330323958a8f0cbe7797847bdc676f1c6c34055c6f8afb949d005a5607d6b220b893910ff973ddc5')

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
