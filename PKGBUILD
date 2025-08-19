# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.15.2
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/d6/50/b9bb77eaf841f2fbd8123d9677815d4ef53b53c4c189c5f789c78ef2d05e/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('fa3f90f17ce185a99514df54b5316bdfa593e98f3eebbb12da301eb25d6dedcd')

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
