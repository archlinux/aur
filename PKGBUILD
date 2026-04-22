# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Immae

pkgname=python-pybtex-docutils
pkgver=1.0.3
pkgrel=2
pkgdesc="A docutils backend for pybtex"
arch=("any")
url="https://github.com/mcmtroffaes/pybtex-docutils"
license=("MIT")
depends=('python' 'python-docutils' 'python-pybtex')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pybtex-docutils/pybtex-docutils-$pkgver.tar.gz")
sha256sums=('3a7ebdf92b593e00e8c1c538aa9a20bca5d92d84231124715acc964d51d93c6b')

build() {
  cd "${srcdir}/pybtex-docutils-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/pybtex-docutils-${pkgver}"
  export PYTHONPATH="${srcdir}/pybtex-docutils-${pkgver}:${srcdir}/pybtex-docutils-${pkgver}/src"
  pytest
}

package() {
  cd "${srcdir}/pybtex-docutils-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
