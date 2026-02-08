# Maintainer: Amish <contact at via dot aur>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=python-eyed3
pkgver=0.9.9
pkgrel=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=('any')
url="https://eyed3.nicfit.net/"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')
depends=('python-deprecation' 'python-filetype' 'python-packaging' 'python-requests' 'python-yaml')
checkdepends=('python-factory-boy' 'python-pytest')
source=("eyed3-${pkgver}.tar.gz::https://github.com/nicfit/eyeD3/archive/refs/tags/v${pkgver}.tar.gz"
        'https://eyed3.nicfit.net/releases/eyeD3-test-data.tgz')
sha256sums=('872d57edbde3f81748df4a581951c20f78c77f02384ee104a2ae8a283f3b084e'
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
