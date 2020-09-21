# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.5.0
pkgrel=1
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python' 'python-numpy')
makedepends=('python-setuptools-rust' 'python-pip' 'rust')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('eb030d5dad9973a1e075687c7943ac5e0be74fbe41e0a7d7258710338f253e84131d82db720193761ae85caf7c7f5ede2e4020451969d0f51978bde18c88b484')

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
