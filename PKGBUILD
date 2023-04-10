# Maintainer: David Runge <dvzrv@archlinux.org>

_name=setuptools-declarative-requirements
pkgname=python-setuptools-declarative-requirements
pkgver=1.3.0
pkgrel=3
pkgdesc="File support for setuptools declarative setup.cfg"
arch=(any)
url="https://github.com/s0undt3ch/setuptools-declarative-requirements"
license=(Apache)
depends=(python-setuptools)
makedepends=(python-build python-installer python-setuptools-scm python-toml python-wheel)
checkdepends=(pypiserver python-pytest python-pytest-shell-utilities python-virtualenv)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('db4fa0219c50c32867b3f9694e1fae488b29d305d67d0a69420d9032b4ad2b2b9a39fb672b0f7425a2fccda9c23e6cf5ef6966b6502e3560e7ae5e412da4114c')
b2sums=('1c48eb5ceb46fa61195c99166c8323c731d5e422c0144fb7eb37e7f637fe2ade9e4adaf063ad88d5f93cee32bb7321a07a081ca12ccd8b5d1b29ef4300badceb')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # disable failing test:
  # https://github.com/s0undt3ch/setuptools-declarative-requirements/issues/4
  pytest -vv -k "not test_build_package[bdist_wheel]"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
