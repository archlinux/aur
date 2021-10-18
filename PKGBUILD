# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.10.2
pkgrel=1
pkgdesc="A high performance Python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('df6830a6e85a9f7a08e6527cc94ea83d65aa3a07299ce9e5ac166355aacbcfbf0ba0df6e13bc22afb2f07d992c2efe79a59e7a5e2fbb99574f0ad49b8ccc9147')

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
