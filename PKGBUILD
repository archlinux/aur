# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-dpcontracts
pkgver=0.6.0
pkgrel=9
pkgdesc="A simple implementation of contracts for Python 3.8"
url="https://github.com/deadpixi/contracts"
license=('LGPL')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://pypi.io/packages/source/d/dpcontracts/dpcontracts-$pkgver.tar.gz"
        "0001-fixing-tox-test-of-README.patch")
sha512sums=('451b541c87ee2ccad3ab18f2328ffffff0fd422e137af8227b7c264f7b91b4270de077f79596008f746a37aef1e5762278b209b8923a6126a74a3b32225d4dd5'
            'abbe0c19e9f4207a60a36cbcddf3202e1f4477768b836c8cbed9b687d6fe99650db333353ddf3f3535828964a01a9e2c3838d8325c254a835f4ad7a195b666b7')

prepare() {
  cd dpcontracts-$pkgver
  patch -p1 -i ../0001-fixing-tox-test-of-README.patch
}

build() {
  cd dpcontracts-$pkgver
  python3.8 setup.py build
}

check() {
  cd dpcontracts-$pkgver
  python3.8 setup.py pytest --addopts README.rst
}

package() {
  cd dpcontracts-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
