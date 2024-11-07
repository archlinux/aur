# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify
pkgver=0.12.0
pkgrel=1
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

  python setup.py build
  make
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 rebind.so "$pkgdir"/usr/lib/websockify/rebind.so
}
b2sums=('d330f534dd69c186b14b14c5f29d2b4f86c1fc444fa887c04b2b9eb2beed2ed0895db029acbcd84714ce2fd6da30cc306cef4c4bb836e31a31f10dbff6dc3abd')
