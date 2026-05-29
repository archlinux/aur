# Maintainer: mokurin000 <mokurin000@gmail.com>

_name_runtime=fluent.runtime
_name_syntax=fluent.syntax
_runtime_ver=0.4.0
_syntax_ver=0.19.0

pkgname=python-fluent
pkgver=${_runtime_ver}_syntax${_syntax_ver}
pkgrel=1
pkgdesc="Python implementation of Project Fluent"
arch=('any')
url="https://github.com/projectfluent/python-fluent"
license=('Apache-2.0')
depends=('python' )
conflicts=("python-${_name_runtime}" "python-${_name_syntax}")
provides=("python-${_name_runtime}" "python-${_name_syntax}")
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/projectfluent/python-fluent/archive/refs/tags/fluent.runtime@${_runtime_ver}.tar.gz")
sha512sums=('6225f9ef88a3a4e67a9e7d4a39e792cd6c03a0a90afba2ff6cf0a99cdd698d884bfe3ee2ffbeb18d93d8ce7dae5bdec9fb8df2b17a9921111d901e0f9a5c4d29')

build() {
    cd "${srcdir}/python-fluent-fluent.runtime-${_runtime_ver}/${_name_runtime}"
    python -m build --wheel --no-isolation

    cd "${srcdir}/python-fluent-fluent.runtime-${_runtime_ver}/${_name_syntax}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/python-fluent-fluent.runtime-${_runtime_ver}/${_name_runtime}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}/python-fluent-fluent.runtime-${_runtime_ver}/${_name_syntax}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
