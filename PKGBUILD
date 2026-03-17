# Maintainer: JSH <jsh 6 7 8 9 at g>

_pkgname=hermes-dec
pkgname=${_pkgname}-git
epoch=1
pkgver=0.1.0.r12.gd1adc33
pkgrel=1
pkgdesc="A tool for reverse engineering React Native Hermes bytecode files"
arch=('any')
url="https://github.com/P1sec/hermes-dec"
license=('AGPL-3.0-or-later')
depends=('python>=3.10' 'clang')
makedepends=('git' 'uv' 'python-build' 'python-installer')
provides=('hermes-dec')
conflicts=('hermes-dec')
source=("git+https://github.com/P1sec/hermes-dec.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  uv build --wheel --no-progress
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
