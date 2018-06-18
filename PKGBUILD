# Maintainer: asermax <asermax@gmail.com>
_branch='cd2a0921aa74d1f85f0fc65dc6cef1b6e4dd0438'

pkgname=kaggle-api
pkgver=1.3.10
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

md5sums=('8cb1fe36fc023c56c09091f143774694')

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
