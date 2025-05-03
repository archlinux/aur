# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify
pkgver=0.13.0
pkgrel=2
pkgdesc="WebSockets support for any application/server"
license=('LGPL3')
arch=('any')
url="https://github.com/novnc/websockify"
makedepends=(python-setuptools)
depends=(python)
optdepends=('python-numpy: for better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novnc/$pkgname/archive/v${pkgver}.tar.gz")
b2sum=('cbae6abdee3c9ba6e78c2245fa7ebc4bd6aa96a534b8577da1ae9acd316dd146cece6ceb6f6cdca9c1ddcb3cbaff69e0fc3c3d6048b9374b0937abb91843bf72')

prepare(){
  cd $pkgname-$pkgver
  sed -i '/numpy/d' setup.py
}
build() {
  cd "$pkgname-$pkgver"

  export CFLAGS="-std=c11 ${CFLAGS}"
  python setup.py build
  make
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 rebind.so "$pkgdir"/usr/lib/websockify/rebind.so
}
b2sums=('6555354be6314f2b3c236b57a61b5713ec3898bf77e2f7c3e1dbb1061fc586f67e2f5adb9259772d94ea67de24f4a2141ad6ba4ad1fd319a6b7e311f428a7f74')
