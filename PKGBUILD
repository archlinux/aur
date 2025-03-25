# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=ydata-profiling
pkgname=python-ydata-profiling
pkgver=4.16.0
pkgrel=1
pkgdesc='Create HTML profiling reports from pandas DataFrame objects'
arch=(any)
url='https://github.com/ydataai/ydata-profiling'
license=(MIT)
depends=(
  ipython
  python
  python-dacite
  python-dateutil
  python-htmlmin
  python-imagehash
  python-ipywidgets
  python-jinja
  python-matplotlib
  python-markupsafe
  python-multimethod
  python-networkx
  python-numba
  python-numpy
  python-packaging
  python-pandas
  python-phik
  python-pillow
  python-pydantic
  python-requests
  python-seaborn
  python-scipy
  python-statsmodels
  python-tangled-up-in-unicode
  python-tqdm
  python-typeguard
  python-visions
  python-wordcloud
  python-yaml
)
conflicts=(python-pandas-profiling)
replaces=(python-pandas-profiling)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)

source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('294f007af0d421b3cf076c1e7956a8ec4cbd34902ec738689f31308c8cad633aa5b1ed984b9901b852ac891db7e0ae98469a405517c4d8c7993e1172c8565fc3')

prepare() {
  # fix version fallback (the git snapshot does not contain the VERSION file)
  sed -i 's|version = "0.0.dev0"|version = "'$pkgver'"|' $_name-$pkgver/setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
