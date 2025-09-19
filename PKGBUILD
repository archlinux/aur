# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-ruby
_gitpkgname=tree-sitter-ruby
pkgver=0.23.1
pkgrel=1
pkgdesc='Ruby Grammar for tree-sitter'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-ruby/releases/download/v${pkgver}/tree-sitter-ruby.tar.xz"
)

sha512sums=('8c3d9c56dc0e311075744978c934765ab948787c8f266379b7aadee83c28b19566605120d58b68c26b4bbf5486f18da30b1cb0be4ba3b0987905e745f055de6f')

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
