# Maintainer: asermax <asermax@gmail.com>
_branch='dddae1ea3911f7ecbda99ad21dbead0397a2d289'

pkgname=kaggle-api
pkgver=3.12
pkgrel=1
pkgdesc='Kaggle API CLI'

arch=('any')
url="http://kaggle.com/"
license=('Apache')

depends=(
  'python'
  'python-urllib3'
  'python-six'
  'python-certifi'
  'python-dateutil'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-setuptools'
)

source=(
  "https://github.com/Kaggle/kaggle-api/archive/${_branch}.tar.gz"
)

md5sums=('80a2b9bb912f445b8319ab17b7146dcc')

prepare() {
  cd "$srcdir"/kaggle-api-$_branch
  # remove urllib3 version restriction
  sed -e '/urllib3/d' \
      -e "s/,<.*'/'/" \
      -i setup.py
}

package() {
  cd "${pkgname}-${_branch}"

  # Python setup
  python setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
