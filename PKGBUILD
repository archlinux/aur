# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-diagnostics
pkgver=0.2.4
pkgrel=1
pkgdesc='Module for logging of detailed traceback as HTML page - Alternative to Pythons module cgitb'
arch=('any')
url='https://github.com/miso-belica/diagnostics'
license=('custom:apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-pytest' 'python-nose')
source=("https://github.com/miso-belica/diagnostics/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('e716828d9d8b7d6d54533b68090d6b14e4edbba5c732ac8687a6cf31e1debd431f9f7bfbc17b8305047556e765037c5f777c8f6e2b6f5f4f65803a17c96cc91d')

build() {
  cd ${pkgname#python-}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname#python-}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname#python-}-${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}"/${pkgname#python-}-${pkgver}/LICENSE.rst "${pkgdir}"/usr/share/licenses/${pkgname#python-}/LICENSE
}
