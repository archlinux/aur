# Maintainer: Matthew Treinish <mtreinish@kortar.org>
_name=retworkx
pkgname=python-retworkx
pkgver=0.3.4
pkgrel=1
pkgdesc="A python graph library implemented in Rust."
url="https://github.com/Qiskit/retworkx"
license=('Apache')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools-rust' 'python-pip' 'rustup')
source=("https://pypi.io/packages/source/r/retworkx/retworkx-$pkgver.tar.gz")
sha512sums=('d4bdfba1312ac545d4e567039cc0163652304978d47607f0e4945f7b66ff3ad5a37afbdcf122bfc5c19a888f839cbde38b69b879f9e52589f06a4f716357fce6')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  rustup override set nightly
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
