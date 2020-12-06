# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.7.1
pkgrel=2
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('f4e7b83096d21f265ac6572a6f122539ac1d118a79ebded637ba3231719c633cdae5171394558d8b4f439b35c315e5d3f8e5f84489ae6063cd7f71019345f67c')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
