# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-python
_gitpkgname=tree-sitter-python
pkgver=0.25.0
pkgrel=1
pkgdesc='Python Grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-ruby'
license=('MIT')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest' 'python-tree-sitter'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-python/releases/download/v${pkgver}/tree-sitter-python.tar.gz"
)

sha512sums=('ef62e026cca497aa0462d24dfcc1484ba9160d02b1f6d47ba64ebed32c4a75f2f9ec61526841be595900f11bccf7d0b5961a5362aec7d6d73a9d38ffa34fb46e')

build() {
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

package() {
  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
