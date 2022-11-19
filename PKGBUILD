# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-pyenum
pkgver=0.3
pkgrel=1
pkgdesc='User friendly implementation of documented Enum type in Python language.'
arch=(any)
url='https://github.com/molejar/pyEnum'
license=(Apache)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://github.com/molejar/pyEnum/archive/${pkgver}/pyEnum-${pkgver}.tar.gz")
b2sums=('559d49f6fa823c841e40dad085b5443aa17410bfd085d1235e3add189cf2ec94d59b5b7e0ead02103f0efc28e72b0ce7293ce6c61b83394c950226f730a01009')

build() {
  cd pyEnum-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd pyEnum-${pkgver}
  python -m pytest
}

package() {
  cd pyEnum-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
