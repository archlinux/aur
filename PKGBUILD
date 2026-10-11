# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.34
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
arch=('i686' 'x86_64')
url="https://github.com/YosysHQ/apicula"
license=('MIT')
depends=('python>=3.9' 'python-msgspec' 'python-fastcrc')
makedepends=('python-setuptools')
provides=('prjapicula')
_name=apycula
source=("apicula-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'version.patch')
sha256sums=('b0b151875be5289eba385d4c6fa62d1b3be49286df70f07e076adaf91678b22c'
            '81f1d4b72a917636272a40a400aa01874ac98429d9a2fa601f0a4a0eafa020fa')

prepare() {
  cd "$srcdir/apycula-$pkgver"

  sed -e "s/@@VERSION@@/$pkgver/" $srcdir/version.patch | patch -p1
}

build() {
  cd "$srcdir/apycula-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/apycula-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
