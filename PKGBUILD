# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-httmock
_name=httmock
pkgver=1.4.0
pkgrel=2
pkgdesc='A mocking library for requests'
arch=('any')
license=('Apache-2.0')
url='https://github.com/patrys/httmock'
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d8674c0bd7c667d02e100f35157f717189ddcfb14d26993a87e8823aec255d191ab6ac53da0cb4035eb37caab36f8f7c6705bf10f0d8d4de62a5aa09cddacfc4')

build() {
  cd "$srcdir"/httmock-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/httmock-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH:$PWD/tests" py.test || warning "Tests failed"
}

package() {
  cd httmock-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
