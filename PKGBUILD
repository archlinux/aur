# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.9.1
pkgrel=2
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
sha256sums=('f531ca79b872a145129d97a4d6e04815c9053345e1d5f291a7112de44a6dba0c'
            '81f1d4b72a917636272a40a400aa01874ac98429d9a2fa601f0a4a0eafa020fa')

prepare() {
  cd "$srcdir/Apycula-$pkgver"

  sed -e "s/@@VERSION@@/$pkgver/" $srcdir/version.patch | patch -p1
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
