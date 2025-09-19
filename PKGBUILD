# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-markdown
_gitpkgname=tree-sitter-markdown
pkgver=0.5.0
pkgrel=1
pkgdesc='Markdown Grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter-grammars/tree-sitter-markdown'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-markdown/releases/download/v${pkgver}/tree-sitter-markdown.tar.gz"
)

sha512sums=('d4a7818ad84c0ad73e4a4357faae595f1e76720c0ea18128726669176f703163cc718e9f94b4f890bf1eafc6c76ad0b304ca6a0c09e3ba439c46e27df73fc9b9')

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
