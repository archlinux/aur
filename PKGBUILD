# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=fal-client
pkgname=python-${_name}
pkgver=0.5.8
pkgrel=1
pkgdesc='Access LiveKit server APIs and generate access tokens.'
arch=('any')
url='https://github.com/fal-ai/fal/tree/main/projects/fal_client'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('140fa7e560c7b881e31a25ce124cebb86c092557ed3c1c5ed0807d0fbfcd5a1e')
depends=('python>=3.8' 'python-httpx' 'python-httpx-sse')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pillow')
optdepends=('python-sphinx: docs' 'python-sphinx_rtd_theme: docs' 'python-sphinx-autodoc-typehints: docs')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
