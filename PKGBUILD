# Maintainer: Amish <contact at via dot aur>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgbase=python2-eyed3
pkgname=('python-eyed3')
pkgver=0.9.7pre
_eyed3_gitrev=2ac035b
pkgrel=1
epoch=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=('any')
url="http://eyed3.nicfit.net/"
license=('GPL')
depends=('python-deprecation' 'python-filetype' 'python-packaging')
checkdepends=('python-factory-boy' 'python-pytest')
#source=("https://files.pythonhosted.org/packages/source/e/eyeD3/eyeD3-${pkgver}.tar.gz"
source=("eyed3-${pkgver}.tar.gz::https://github.com/nicfit/eyeD3/archive/${_eyed3_gitrev}.tar.gz"
        'http://eyed3.nicfit.net/releases/eyeD3-test-data.tgz')
sha256sums=('7fa9753f9b9fad089b4576a22c2d13cbba4f275a5a5c4a211bb27f73bf1a0bb0'
            '8bd11c921e0e34f88b84f1a51e24290d0243f3b2660233a527902f2c13af3a67')
options=(!emptydirs)

build() {
  cd "eyeD3-${_eyed3_gitrev}"*
  python setup.py build
}

check() {
  cd "eyeD3-${_eyed3_gitrev}"*
  ls -lh
  ln -s "${srcdir}"/eyeD3-test-data.tgz tests/
  make test-data
  # Skipping display plugin tests because grako is not packaged, and abandoned upstream
  python -m pytest --deselect tests/test_display_plugin.py
}

package_python-eyed3() {
  cd "eyeD3-${_eyed3_gitrev}"*
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
