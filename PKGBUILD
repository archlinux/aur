# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname=ast_decompiler
pkgname="python-${_pkgname}"
pkgdesc='Python module to decompile AST to Python code'
pkgver='0.8.0'
pkgrel=1
url='https://github.com/JelleZijlstra/ast_decompiler'
arch=(any)
license=(Apache-2.0)
checkdepends=(python-pytest)
makedepends=(python-build python-flit-core python-installer)
depends=(python)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/ast_decompiler/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(c220b1384e616f1d0f553e5e9a49d0afe2dc8a30c1b934724f70662876b3e56594b1391343d67cb041da97f890a0fd2c40aa3d553ba667050d0457131526d8c1)

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 << EOF
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -1,6 +1,6 @@
 # Build system requirements.
 [build-system]
-requires = ["flit_core >=3.4,<4"]
+requires = ["flit_core >=3.4"]
 build-backend = "flit_core.buildapi"
 
 # Project metadata
EOF
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
