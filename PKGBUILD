# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SeleniumBase
pkgname=python-${_base,,}
pkgdesc="A complete web automation framework for end-to-end testing"
pkgver=4.15.9
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
sha512sums=('bce471aefde4d0973dac8b22ee9a113822ff924b2cc2b943d695ed65fa038379f55d14a9ddad5392423cc56b441155398eb7c2bb27502cd3e7b0fc3bec4ddc4f')

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
