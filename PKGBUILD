# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=imediff
pkgver=2.7
pkgrel=1
pkgdesc="ncurses-based 2/3 file merge tool"
arch=('any')
url="https://github.com/osamuaoki/imediff"
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c48faa25aa97427a3883c19511d93c679e55e2ec1a7d2ecb0a9533c92f9ee9a')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s:^\(VERSION = \).*:\1\"${pkgver}\":" src/imediff/__main__.py
}

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
