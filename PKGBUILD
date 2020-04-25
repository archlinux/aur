# Maintainer: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>
pkgname=kaggle-api
_name=kaggle
pkgver=1.5.6
pkgrel=1
pkgdesc='Kaggle API CLI'
arch=('any')
url="https://github.com/Kaggle/kaggle-api"
license=('Apache')
depends=(
  'python'
  'python-urllib3'
  'python-six'
  'python-certifi'
  'python-dateutil'
  'python-requests'
  'python-tqdm'
  'python-slugify'
)
makedepends=(
  'python-setuptools'
)
source=(
  ${pkgname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  263.patch::'https://github.com/Kaggle/kaggle-api/commit/8f08ba91095fac8e1e2b8783ce9dbae47c0d7ef7.patch'
)
sha512sums=(
  'bdd05342357f835a5186994e95017d4bdf0d7fef2b70c6a8b142c4d19ce1fd797b85058f958ade033795f3fca0a51482aeb9e09d55d5ed58e3256e0eedc8fbae'
  '79b5617f9f46506eb9f3eea3f87475525dcd210a5837d04c8fc5252bb58cb6601fabf40b52b90132c75ad5172279f90438ae1bc4bd52311e3dbb0df1fd6f9a30'
)

prepare() {
  cd "${_name}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/263.patch"
}

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
