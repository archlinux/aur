pkgname=nitpick
pkgver=0.26.0
pkgrel=1
pkgdesc="Enforce the same settings across multiple language-independent projects"
arch=('any')
url="https://github.com/andreoliwa/nitpick"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python-dephell'
)
checkdepends=(
  'python-pytest'
  'python-responses'
  'python-testfixtures'
  'python-freezegun'
  'python-pytest-socket'
)
depends=(
  'flake8'
  'python'
  'python-attrs'
  'python-autorepr'
  'python-cachy'
  'python-click'
  'python-configupdater'
  'python-dictdiffer'
  'python-identify'
  'python-jmespath'
  'python-loguru'
  'python-marshmallow-polyfield'
  'python-marshmallow'
  'python-more-itertools'
  'python-pluggy'
  'python-pydantic'
  'python-requests'
  'python-ruamel-yaml'
  'python-slugify'
  'python-sortedcontainers'
  'python-toml'
  'python-tomlkit'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4afd9e848c4655ffe2b7d49a49c3c32b236f3ee1f7240c0bec6a4ee7d70acd16')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH=src py.test -vvv tests/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
