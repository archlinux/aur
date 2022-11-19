# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>

pkgname=python38-jinja
pkgver=3.1.2
pkgrel=2
epoch=1
pkgdesc="A simple pythonic template language written in Python 3.8"
arch=('any')
url="https://palletsprojects.com/p/jinja/"
license=('BSD')
depends=('python38-markupsafe')
makedepends=('python38-setuptools')
optdepends=('python38-babel: for i18n support')
checkdepends=('python38-pytest')
source=(https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-$pkgver.tar.gz)
sha256sums=('31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852')

build() {
  cd Jinja2-$pkgver
  python3.8 setup.py build
}

check() {
  cd Jinja2-$pkgver
  # https://github.com/pypa/setuptools/issues/2466
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=build/lib pytest \
    --deselect tests/test_loader.py::test_package_dir_list \
    --deselect tests/test_loader.py::test_package_dir_source \
    --deselect tests/test_loader.py::test_package_file_list \
    --deselect tests/test_loader.py::test_package_file_source \
    --deselect tests/test_loader.py::test_package_zip_list \
    --deselect tests/test_loader.py::test_package_zip_omit_curdir \
    --deselect tests/test_loader.py::test_package_zip_source
}

package() {
  cd Jinja2-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
