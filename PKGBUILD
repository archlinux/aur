# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=blacken-docs
pkgdesc="Run black on python code blocks in documentation files"
pkgver=1.12.1
pkgrel=1
arch=(any)
url="https://github.com/asottile/${pkgname}"
license=(MIT)
depends=(python-black)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a7c03fd24639149e4d29a97a30d82d6082a30a54fda9106bfd5a21b162160904bafcc7d1dff1b27753fd6e84d754babf1668be6b53418ad41d29b5bd8274369e')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
