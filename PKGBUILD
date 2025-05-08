# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=usaddress
pkgname=python-${_base}
pkgver=0.5.14
pkgrel=1
pkgdesc="A python library for parsing unstructured United States address strings into address components."
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python' 'python-crfsuite'  'python-probableparsing')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-parserator')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('dea101d027b41a1bd6a3037e0be4237b3bb0f0705cb18e1590490a646712be842107fbc17354a8949508ed0c96f7bee331b821d28491665d72b047a741614085')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
