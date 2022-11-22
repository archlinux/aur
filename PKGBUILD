# Maintainer: Amish <contact at via dot aur>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=python-eyed3
pkgver=0.9.7pre
_eyed3_gitrev=6ae1554
pkgrel=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=('any')
url="http://eyed3.nicfit.net/"
license=('GPL')
depends=('python-deprecation' 'python-filetype' 'python-packaging')
checkdepends=('python-factory-boy' 'python-pytest')
source=("eyed3-${pkgver}-${_eyed3_gitrev}.tar.gz::https://github.com/nicfit/eyeD3/archive/${_eyed3_gitrev}.tar.gz"
        'http://eyed3.nicfit.net/releases/eyeD3-test-data.tgz')
sha256sums=('9621aa18e9d4c76911489359576869c4d87e94da353e70698151f75f9f5dae33'
            'b7cd2fe8d7114f597dbe1e06c11587af566cf92f640cef9af6408a824face37f')
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

package() {
  cd "eyeD3-${_eyed3_gitrev}"*
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
