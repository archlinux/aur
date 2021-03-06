# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.8.0
pkgrel=1
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('2aa5552a53b107e6aee44cf7e36978a6f4368e550da161f3e3fd4196789cc938a653209b0dfa87b4f327b313be485a142d511b7194bb5715ed48a064205bbe5d')

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
