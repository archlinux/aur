# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=usaddress
pkgname=python-${_base}
pkgver=0.5.12
pkgrel=1
pkgdesc="A python library for parsing unstructured United States address strings into address components."
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python' 'python-crfsuite'  'python-probableparsing')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-parserator')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('114e262984680edd8d4c2999a0f3dc2e10aa84cebfe99da95175da04816b071851c67b98e29a37a31da05baca6682615e2ceb34a27d27c0cae2c6fc94baaabd9')

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
