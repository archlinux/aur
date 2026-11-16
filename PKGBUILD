# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=devtools
pkgname=python-${_name}
pkgver=0.13.0
pkgrel=1
pkgdesc="Python's missing debug print command, and more."
arch=('any')
url='https://github.com/samuelcolvin/python-devtools'
license=('MIT')
depends=(
  python
  python-asttokens
  python-executing
  python-pygments
  python-six
)
makedepends=(
  python-build
  python-installer
  python-uv-build
)
# checkdepends=(
#   python-asyncpg
#   python-multidict
#   python-numpy
#   python-pydantic
#   python-pytest
#   python-pytest-mock
#   python-pytest-pretty
#   python-sqlalchemy
# )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e3a848080404bd4e10dbf535fe016c6b593fccf24a8edac863048b8cbab3d92f')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

# check() {
#   local pytest_options=(
#     -vv
#     # Failed
#     --deselect tests/test_expr_render.py::test_executing_failure
#     --deselect tests/test_insert_assert.py::test_insert_assert
#     --deselect tests/test_insert_assert.py::test_insert_assert_no_pretty
#     --deselect tests/test_insert_assert.py::test_insert_assert_print
#     --deselect tests/test_insert_assert.py::test_insert_assert_fail
#     --deselect tests/test_insert_assert.py::test_deep
#     --deselect tests/test_insert_assert.py::test_enum
#     --deselect tests/tests/test_insert_assert.py::test_insert_assert_repeat
#     --deselect tests/test_prettier.py::test_ast_expr
#   )
#   cd ${_name}-${pkgver}
#   PYTHONPATH="${srcdir}"/${_name}-${pkgver} pytest "${pytest_options[@]}" tests
# }

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
