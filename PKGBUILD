# Contributor: Andrew Sun <adsun701@ at mail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

_name=globus_sdk
pkgname=python-globus-sdk
pkgver=3.65.0
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=('any')
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-cryptography' 'python-six' 'python-requests' 'python-pyjwt' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-installer' 'python-build')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cbb64f9d03085de1b8d82bb0f96a42231d3cb6e1db11435402bfdbc395baa338')

prepare() {
  cd "${srcdir}/globus-sdk-python-${pkgver}"
  # don't install tests package
  sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

build() {
  cd "${srcdir}/globus-sdk-python-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/globus-sdk-python-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
