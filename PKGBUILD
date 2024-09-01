# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-inquirer3
pkgver=0.6.1
pkgrel=1
pkgdesc='A collection of common interactive command line user interfaces, based on Inquirer.js (fork of magmax/python-inquirer)'
arch=('any')
url='https://github.com/guysalt/python-inquirer3'
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-setuptools' 'python-pexpect')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('faa70dd164a0a0befc60ef4c07b231e4a925fcac565ce9a14f5cec3deb368b9b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PYTHONPATH="${PWD}/src"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
