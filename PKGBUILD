# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.15.5
pkgrel=1
arch=(any)
url="https://${_base,,}.io"
license=(MIT)
depends=(python-yaml python-rich python-requests-toolbelt python-pdbp python-selenium
  python-fasteners python-cssselect python-beautifulsoup4 python-behave python-cffi
  python-charset-normalizer python-cryptography python-execnet python-filelock
  python-keyring python-parameterized python-parse-type)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base,,}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('2375242fc3f450b2f6a607564cdca42afd84c5b6e7078316e6609f72dc657ae07e113609687410c0330e2a632ef9f664ee6ea3855d8e4a5b725f56d87586260b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest examples/unit_tests/verify_framework.py --browser=chrome --headless
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
