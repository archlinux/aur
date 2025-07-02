# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.14.4
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/5c/e8/ae5d959ed7eefea05f7e6ef6681064ac10de543be9aec68bfe103b6a62b4/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('b07b4be5329547a88ff69460d3fa26c34817ab1804406f1571303390bde38d6b')

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
