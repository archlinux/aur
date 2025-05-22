# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name="prompt-toolkit"
pkgname="python-${_name}"
pkgver=3.0.51
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python."
arch=('any')
url="https://python-prompt-toolkit.readthedocs.io"
license=('BSD-3-Clause')
depends=('python' 'python-wcwidth' 'python-pyperclip' 'python-pygments' 'python-asyncssh')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-typing_extensions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('931a162e3b27fc90c86f1b48bb1fb2c528c2761475e57c9c06de13311c7b54ed')

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
  python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
