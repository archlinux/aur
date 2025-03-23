# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name="micropip"
pkgname="python-${_name}"
pkgver=0.9.0
pkgrel=1
_pyodide_pkgver=0.25.0
pkgdesc="A lightweight Python package installer for the web."
arch=('any')
url="https://github.com/pyodide/micropip"
license=('MPL-2.0')
depends=('python>=3.12')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-httpserver' 'python-pytest-pyodide' 'python-pytest-cov' 'python-pytest' 'python-build' 'python-pyodide-lock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
#        "https://github.com/pyodide/pyodide/releases/download/${_pyodide_pkgver}/pyodide-${_pyodide_pkgver}.tar.bz2")
sha256sums=('d72c3224537a14e5d9d02f29e945bf7cde02404ec744291e8f6a310cedf60b66')
#            '111ab960d294923b51ff68dedcd6495aeb45a967ea0b266fd2f4f9edb2b5e5c7')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

# The pyodide isn't compatible with python 3.13 yet
#check() {
#  local pytest_options=(
#    -vv
#    --override-ini="addopts="
#    -p no:flaky
#    --dist-dir="${srcdir}"/pyodide/
#  )
#  cd "${srcdir}"/${_name}-${pkgver}
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
