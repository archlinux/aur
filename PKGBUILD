# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.10.1
pkgrel=1
pkgdesc="A high performance Python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('ad966eb547665a98ad86f4f0e7d8dbbf12078aceb61e905788e119830b23b5d64847a6f46c13b580eccaa6583acff56a5ac542d80eaf2b11e9ea3177cca4da1d')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python_version=`python --version | grep -Eo '3\.[0-9]'`
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  cp -r build/lib/retworkx ${pkgdir}/usr/lib/python$python_version/site-packages/.
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cd ${pkgdir}/usr/lib/python$python_version/site-packages
}
