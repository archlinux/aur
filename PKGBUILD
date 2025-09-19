# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-json
_gitpkgname=tree-sitter-json
pkgver=0.24.8
pkgrel=1
pkgdesc='JSON Grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-json'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-json/releases/download/v${pkgver}/tree-sitter-json.tar.xz"
)

sha512sums=('b7c01341fbcd749bf76ad4a029f94f69b8da23f545518bbe013ed09afaf709c0d72be4a036e49b6584690ea9eaa04f8ec62aac17e07bb9b642bb43cb4502d846')

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
