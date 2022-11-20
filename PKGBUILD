# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-testresources
pkgver=2.0.1
pkgrel=10
pkgdesc="Testresources, a pyunit extension for managing expensive test resources"
arch=('any')
license=('Apache' 'BSD')
url="https://launchpad.net/testresources"
depends=('python38')
makedepends=('python38-pbr' 'python38-testtools')
source=("https://pypi.io/packages/source/t/testresources/testresources-$pkgver.tar.gz")
sha512sums=('0b23432b019400fe378e957d14a91083eef7fe1130a494b567a5274d69e4e8e09ab75861e5453c3f217507e144cf179c908f84dd1a807992d4bee0b8d32cb0f4')

build() {
  cd testresources-$pkgver
  python3.8 setup.py build
}

check() {
  cd testresources-$pkgver
  python3.8 -m testtools.run discover
}

package() {
  cd testresources-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
