# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=fal-client
pkgname=python-${_name}
pkgver=0.5.9
pkgrel=1
pkgdesc='Python client for fal.ai.'
arch=('any')
url='https://github.com/fal-ai/fal/tree/main/projects/fal_client'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('238a5300293d8d8da1204f4455dc78b1539f2ff20122f870e7280ccc29f28922')
depends=('python>=3.8' 'python-httpx' 'python-httpx-sse')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pillow')

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
