# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.15.1
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/b8/a7/f61fe9ca8e6207e6b2a91f868e204fb540bb2a55273556d8d52588667731/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('ba1ed7ce1c7894a37c06e33a46c15b5a38b490780f44095945aeb3505efeacc1')

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
