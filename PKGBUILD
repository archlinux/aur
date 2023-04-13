# Maintainer: Amish <contact at via dot aur>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=python-eyed3
pkgver=0.9.7
#_eyed3_gitrev=6ae1554
pkgrel=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=('any')
url="https://eyed3.nicfit.net/"
license=('GPL')
makedepends=('python-setuptools')
depends=('python-deprecation' 'python-filetype' 'python-packaging' 'python-requests' 'python-yaml')
checkdepends=('python-factory-boy' 'python-pytest')
#source=("eyed3-${pkgver}-${_eyed3_gitrev}.tar.gz::https://github.com/nicfit/eyeD3/archive/${_eyed3_gitrev}.tar.gz"
source=("eyed3-${pkgver}.tar.gz::https://github.com/nicfit/eyeD3/archive/refs/tags/v${pkgver}.tar.gz"
        'https://eyed3.nicfit.net/releases/eyeD3-test-data.tgz')
sha256sums=('808f2d376b585ff13c35f614b970f3392c0f15de191c5a96c6b04532bf2217ec'
            'b7cd2fe8d7114f597dbe1e06c11587af566cf92f640cef9af6408a824face37f')
options=(!emptydirs)

build() {
  cd "eyeD3-${pkgver}"
  python setup.py build
}

check() {
  cd "eyeD3-${pkgver}"
  ln -s "${srcdir}"/eyeD3-test-data.tgz tests/
  make test-data
  python -m pytest
}

package() {
  cd "eyeD3-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
