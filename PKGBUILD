# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
_name=fastcluster
pkgname=python-${_name}
pkgver=1.2.6
pkgrel=1
pkgdesc="Fast hierarchical clustering routines for R and Python"
arch=(any)
url="https://pypi.org/project/${_name}"
license=('custom:BSD-2-clause')
depends=(python-numpy)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('94a11ddd80fe219a91f1713230decfde761cd745a6ce0782e5cc0ab7d9818855d031be8c79f97256f0266fd6992a9fa4b0f5e7a30cb42387810fd8baff2a2135')

build() {
  cd ${_name}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
