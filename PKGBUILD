# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-speech
pkgname=python-${_name}
pkgver=2.30.0
pkgrel=3
pkgdesc='Cloud Speech: enables easy integration of Google speech recognition technologies into developer applications. Send audio and receive a text transcription from the Speech-to-Text API service.'
arch=('any')
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('ec63cbd4c2bbdb0306462a0f30082f4495dedc506f0c4a1a2990ee6e6346544c')
depends=('python>=3.7' 'python-google-api-core' 'python-grpcio' 'python-grpcio-status' 'python-google-auth' 'python-proto-plus' 'python-protobuf')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests --deselect "tests/system/smoke_test.py"
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
