# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.4.0
pkgrel=1
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'python-pip' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('5628cad346a1a40f52ab03201d10e8201b80f7e923d213f54285158b18cd957192011d3e86dc9c3ee23f98d1ebc9840b048fb86b0e103c9ab48e112f039fe482')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export PIP_CONFIG_FILE=/dev/null
  pip wheel .
}

package() {
  cd "$pkgname-$pkgver"
  export PIP_CONFIG_FILE='/dev/null'
  pip install --isolated \
              --root="$pkgdir" \
              --ignore-installed \
              --no-deps "$_name-$pkgver"*.whl
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
