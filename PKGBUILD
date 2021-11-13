# Maintainer: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=python-lava
pkgver=0.1.1
pkgrel=1
pkgdesc='A software framework for developing neuro-inspired applications and mapping them to neuromorphic hardware'
arch=('any')
url='https://github.com/lava-nc/lava/'
license=('custom:BSD-3' 'LGPL2.1')
depends=('python-pip' 'python-wheel' 'python-pytest' 'python-numpy' 'python-matplotlib')
makedepends=('python-pybuilder' 'python-sphinx' 'flake8' 'bandit'
             'python-sphinx-tabs' 'python-sphinx_rtd_theme' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lava-nc/lava/archive/v$pkgver.tar.gz")
sha512sums=('36c2873efa8a3676490899a037d94c4f19d5e96c900416b1903eafd9e7e9bce59ff3b79232395e768e08c401e1b34e7026703f48c7c8a1da31388d4fcdeda4e5')

prepare() {
  cd lava-$pkgver
  sed 's/version = "0.1.0"/version = "0.1.1"/g' -i build.py
}

build() {
  cd lava-$pkgver
  export PYTHONPATH=`pwd`
  pyb -E unit
}

package() {
  install -Dm644 lava-$pkgver/src/lava/magma/core/LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3"
  cd lava-$pkgver/target/dist/lava-nc-$pkgver/
  python setup.py install --root="$pkgdir" -O1
}
