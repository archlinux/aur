# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.14.2
pkgrel=1
pkgdesc="A parallelized gzip decoder with seek capability"
arch=('x86_64')
url="https://github.com/mxmlnkn/${_program_name}"
license=(
	'Apache'
	'MIT'
)
depends=('python>=3.6')
makedepends=(
	'nasm'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'cython'
)
_pkg_ext=".tar.gz"
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/18/96/4b47bcdeea98e25ce6a094a81abe3cdfc8b58c5853f7ab8ad75688492221/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('f3836269a381c3a92a07055f55372769e6d16901f96e0f49bf1a21c109186409')

provides=("rapidgzip")

build() {
	cd "$srcdir/${_program_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_program_name}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	install -Dm755 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
