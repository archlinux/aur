# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.16.0
pkgrel=3
pkgdesc="A parallelized gzip decoder with seek capability"
arch=('x86_64')
url="https://github.com/mxmlnkn/${_program_name}"
license=(
    'Apache-2.0'
    'MIT'
)
depends=(
    'python>=3.9'
    'glibc'
    'gcc-libs'
)
makedepends=(
    'nasm'
    'python-build'
    'python-installer'
)
_pkg_ext=".tar.gz"
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/95/9a/d94edac485ade88fbee6864d057eae8a5363bf734da5760f4e99f7a02d94/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('8b124f29bc12de4249ab81e83e5ad35e67742a1a8ff4acb61b74c0d9fda1c14e')

provides=("rapidgzip")

build() {
    cd "$srcdir/${_program_name}-${pkgver}"
    python -m build --wheel
}

package() {
    cd "$srcdir/${_program_name}-${pkgver}"
    python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
    install -Dm755 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
