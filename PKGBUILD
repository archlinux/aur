# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=dataprep
pkgname=python-${_base}-git
pkgver=0.4.4.r22.gbe3f00c
pkgrel=2
pkgdesc="A low code data preparation library in python -- git version"
arch=('any')
url="https://github.com/sfu-db/${_base}"
license=('MIT')
depends=('python' 'python-bokeh' 'python-dask' 'python-nltk' 'python-numpy' 'python-pandas' 'python-pydot' 'python-scipy' 'python-wordcloud' 'python-sqlalchemy' 'python-aiohttp' 'python-ipywidgets' 'python-jinja' 'python-jsonpath-ng' 'python-pydantic' 'python-tqdm' 'python-flask' 'python-flask' 'python-flask-cors' 'python-metaphone' 'python-stdnum' 'python-regex' 'python-varname' 'python-crfsuite' 'python-rapidfuzz')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_base}"
  git -C "${srcdir}/${_base}" clean -dfx
}

build() {
  cd "${_base}"
	## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
