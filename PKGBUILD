# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-sql
_gitpkgname=tree-sitter-sql
pkgver=0.3.11
pkgrel=1
pkgdesc='SQL Grammar for tree-sitter'
arch=('x86_64')
url="https://github.com/DerekStride/tree-sitter-sql"
license=('MIT')
depends=(
  'glibc'
  'python'
  ${_gitpkgname}
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/DerekStride/tree-sitter-sql/releases/download/v${pkgver}/tree-sitter-sql-v${pkgver}.tar.gz"
  "README.md"
)

sha512sums=('fdcd012c99660225736deb4a1c3c6c81eb02a04c608321d7382cc3cc4760d8e2eef82a1be5a116965729d0334f1068aced7f18f65a4f864328bf883df639ad05'
            '4cc449c77d6ac9b464a139fb076b138c21c0ca0a6f7a17f2179f78470deae35c60d225538b7f0248b39606ed7eb32e15dcad549ccbfed925bebfc92888ff3a80')

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
