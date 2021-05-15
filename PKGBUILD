# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.0.1a8
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
arch=('i686' 'x86_64')
url="https://github.com/YosysHQ/apicula"
license=('MIT')
depends=('python>=3.6' 'python-numpy' 'python-pandas' 'python-pillow' 'python-crcmod' 'python-openpyxl')
makedepends=('python-setuptools')
provides=('prjapicula')
source=("apicula-$pkgver.tar.gz::https://files.pythonhosted.org/packages/e4/be/e319ff6825b09719abeab8037aa41d4b10bc5435b99c2f7cd2f1db87f9f5/Apycula-0.0.1a8.tar.gz"
        'version.patch')
sha256sums=('5e9da9ca03e78a49e7cac74409ac16b243cafa1fd5d9bf980af9033071f30cd0'
            '0bd1f08552e3daa5729abaa81d40d01cca3e47ea49797c23b82d0e7a8103187a')

prepare() {
  cd "$srcdir/Apycula-$pkgver"

  patch -p1 < ../version.patch
}

build() {
  cd "$srcdir/Apycula-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Apycula-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
