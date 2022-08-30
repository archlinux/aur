# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgbase=python2-eyed3
pkgname=('python-eyed3')
pkgver=0.9.6
pkgrel=1
epoch=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=('any')
url="http://eyed3.nicfit.net/"
license=('GPL')
depends=('python-deprecation' 'python-filetype' 'python-packaging')
checkdepends=('python-factory-boy' 'python-pytest')
source=(https://files.pythonhosted.org/packages/source/e/eyeD3/eyeD3-$pkgver.tar.gz
        http://eyed3.nicfit.net/releases/eyeD3-test-data.tgz)
sha256sums=('4b5064ec0fb3999294cca0020d4a27ffe4f29149e8292fdf7b2de9b9cabb7518'
            '8bd11c921e0e34f88b84f1a51e24290d0243f3b2660233a527902f2c13af3a67')
options=(!emptydirs)

build() {
  cd eyeD3-$pkgver
  python setup.py build
}

check() {
  cd eyeD3-$pkgver
  ls -lh
  ln -s "$srcdir"/eyeD3-test-data.tgz tests/
  make test-data
  # Skipping display plugin tests because grako is not packaged, and abandoned upstream
  python -m pytest --deselect tests/test_display_plugin.py
}

package_python-eyed3() {
  cd eyeD3-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
