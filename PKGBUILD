pkgname=apio
_name=apio
pkgver=0.7.4
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-pyjwt' 'python-colorama' 'python-requests' 'sudo' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3b2b779d8974df89e5d0a0621a27f5461206a4c3d23828e35721c7ddc3fdc658')

build() {
  cd "$pkgname-$pkgver"

  sed -i 's/from distutils.core import setup/from setuptools import setup/g' ./setup.py
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"/  --optimize=1
}
