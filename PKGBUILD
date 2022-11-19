# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-sphinx-autodoc-typehints
_pyname=${pkgname/python38-/}
_gitcommit=2f863c20f83bb789610982375cb76b3c45bb787e
pkgver=1.13.1
pkgrel=1
pkgdesc='Type hints support for the Sphinx autodoc extension'
url='https://github.com/agronholm/sphinx-autodoc-typehints'
arch=('any')
license=('MIT')
depends=('python38' 'python38-sphinx' 'python38-typing_extensions')
makedepends=('git' 'python38-setuptools' 'python38-setuptools-scm')
checkdepends=('python38-pytest' 'python38-sphobjinv')
source=("git+https://github.com/agronholm/sphinx-autodoc-typehints#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${_pyname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pyname}
  python3.8 setup.py build
}

check() {
  cd ${_pyname}
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd ${_pyname}
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
