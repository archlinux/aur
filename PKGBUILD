# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.14.5
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/a6/b6/27975b6e7ec25c3fac16cbc73270954fb36ad239dda8b1f7bfb3f424dd2c/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('faed46013a1a62a5193c49615a896683ea5c14ed4744bcb4bd1869b1420551d8')

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
