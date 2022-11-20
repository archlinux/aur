# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-ini2toml
pkgver=0.11.1
pkgrel=1
pkgdesc="Automatically conversion of .ini/.cfg files to TOML equivalents"
url="https://github.com/abravalheri/ini2toml"
license=('MPL')
arch=('any')
# The default installation is broken. Adding [full] flavor dependencies here.
depends=('python38-configupdater' 'python38-packaging' 'python38-tomlkit')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-cov' 'python38-tomli-w' 'python38-validate-pyproject')
source=("https://github.com/abravalheri/ini2toml/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5229072e5ebaffb1c2efd16f58f72c562fd1ca73d3ce46dccc80672085301f9d35460796f8ac4118ea37f970e45d4e4d4efd3da8e4a88c6a696f1e8b644cf1cd')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd ini2toml-$pkgver
  python3.8 setup.py build
}

check() {
  cd ini2toml-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  # TODO
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --deselect tests/test_cli.py::test_auto_formatting
}

package() {
  cd ini2toml-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
