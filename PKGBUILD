# Maintainer: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=python-lava-nc
pkgver=0.9.0
pkgrel=1
pkgdesc='A software framework for developing neuro-inspired applications and mapping them to neuromorphic hardware'
arch=('any')
url='https://github.com/lava-nc/lava/'
license=('custom:BSD-3' 'LGPL2.1')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lava-nc/lava/archive/v$pkgver.tar.gz")
sha512sums=('84d7d327979b72a862ef81ae66efdbc4e4c4696290e2fa1d9b56f368816018772d044350bcd705618b1a296d23d994d105eafb50dcef09226c09e2eefe4c99df')

prepare() {
  sed 's/<3.11/<3.12/g' -i lava-$pkgver/pyproject.toml
}

build() {
  cd lava-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd lava-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
