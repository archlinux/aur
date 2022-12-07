# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.5.1
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
arch=('i686' 'x86_64')
url="https://github.com/YosysHQ/apicula"
license=('MIT')
depends=('python>=3.6' 'python-numpy' 'python-pandas' 'python-pillow' 'python-crcmod' 'python-openpyxl')
makedepends=('python-setuptools')
provides=('prjapicula')
_name=Apycula
source=("apicula-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'version.patch')
sha256sums=('89cc88be7bc725264a239f5cdd87b11e8a833dff0f8619fdfb1d7b5abd7b690f'
            '3e34ba9efbd5f635b560aa07762309460977fb243caea6d2f31a24ede7748c17')

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
