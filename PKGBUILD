# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python38-bottleneck
pkgver=1.3.5
pkgrel=1
pkgdesc="Fast NumPy array functions written in Cython"
arch=(x86_64)
url="https://github.com/kwgoodman/bottleneck"
license=(BSD)
depends=(python38-numpy)
makedepends=(python38-setuptools)
checkdepends=(python38-pytest)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cb39611e58e1661447000d6fb65207a73b1e355cb82174154563949e4cceea57')

build() {
  cd bottleneck-${pkgver}
  python3.8 setup.py build
}

check() {
  cd bottleneck-${pkgver}
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python setup.py install --skip-build
  test-env/bin/python /usr/bin/pytest -vv --color=yes --pyargs bottleneck
}

package() {
  cd bottleneck-${pkgver}
  python3.8 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
