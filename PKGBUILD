# Maintainer: graysky <therealgraysky AT proton DOT me>
#
# Python (SWIG) bindings for liblgpio. Dynamically linked against the
# system liblgpio (see the liblgpio package in this same directory tree)
# rather than the statically-bundled build upstream ships to PyPI.

pkgname=python-lgpio
_name=lgpio
pkgver=0.2.2.0
pkgrel=1
pkgdesc="Python bindings for liblgpio (GPIO access on Raspberry Pi and other SBCs)"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://abyz.me.uk/lg/py_lgpio.html"
license=('custom:unknown')
depends=('python' 'liblgpio')
makedepends=('swig' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/lgpio/$_name-$pkgver.tar.gz")
sha256sums=('11372e653b200f76a0b3ef8a23a0735c85ec678a9f8550b9893151ed0f863fff')

build() {
  cd "$_name-$pkgver"
  # PYPI=0 (the default) selects setup.py's dynamically-linked build against
  # the system liblgpio/lgpio.h, instead of statically compiling in a copy
  # of the C sources as upstream's PyPI wheels do.
  PYPI=0 python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYPI=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
