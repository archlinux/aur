# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.9.0
pkgrel=1
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('6506da030f4f1f30fc41725dfdebdfd2b0a9f4276f0075c0b72b62f688cb788c223099efe8b6b8f4ccd70eee2ec3792cb5234e93327402ea4ce7b76a57caf8b1')

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
