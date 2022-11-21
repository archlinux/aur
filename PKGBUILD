# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python38-pikepdf
pkgver=6.2.4
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=(x86_64)
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=(pybind11 python38-build python38-installer python38-wheel python38-toml python38-setuptools-scm)
depends=(python38-lxml python38-pillow python38-deprecation python38-typing_extensions python38-packaging qpdf)
checkdepends=(python38-pytest-xdist python38-hypothesis python38-psutil)
source=(https://pypi.python.org/packages/source/p/pikepdf/pikepdf-$pkgver.tar.gz)
sha256sums=('3d06dabf16592bb7975e1124000212c3c3bab1e97ed3f7c6534ea92efe9b621a')

build() {
  cd pikepdf-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd pikepdf-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd pikepdf-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
