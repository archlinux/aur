# Maintainer: David Runge <dvzrv@archlinux.org>

_name=sphinx-argparse
_pypi_name=sphinx_argparse
pkgname=python38-sphinx-argparse
pkgver=0.4.0
pkgrel=1
pkgdesc="Sphinx extension that automatically documents argparse commands and options"
arch=(any)
url="https://github.com/ashb/sphinx-argparse"
license=(MIT)
depends=(python38-sphinx)
makedepends=(python38-build python38-installer python38-poetry-core python38-wheel)
checkdepends=(python38-pytest)
optdepends=('python38-commonmark: markdown support')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_pypi_name-$pkgver.tar.gz)
sha512sums=('b96050da6c02f87c54f9dc9146bed955e99258df740b467575a2b3e9919fa8c4c6d30a736dab24360086bfc0d7d09c4bc7a818700af2c7846eed3a3b99053d65')
b2sums=('73118f56ff82d52f04066b9d500aebc77eb5a0fecd03fa69f382c0f2afc0cbffdd395da707cf37b59f039e93935f8d5c3fe0e0f7a2820d3b6509dd78b37b0d74')

build() {
  cd $_pypi_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pypi_name-$pkgver
  pytest -vv
}

package() {
  cd $_pypi_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
