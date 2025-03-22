# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name="prompt-toolkit"
pkgname="python-${_name}"
pkgver=3.0.50
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python."
arch=('any')
url="https://python-prompt-toolkit.readthedocs.io"
license=('BSD-3-Clause')
depends=('python>=3.8' 'python-wcwidth' 'python-pyperclip' 'python-pygments' 'python-asyncssh')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-typing_extensions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('544748f3860a2623ca5cd6d2795e7a14f3d0e1c3c9728359013f79877fc89bab')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
