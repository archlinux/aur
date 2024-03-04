# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.13.0
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/88/0f/232b7a179856de769d4bfc682995e5eedcaffa11ad0d2e741ae269bcdcb2/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('3304f8fb0ce53577c32d3fe8fe84f58b2f5c565148217735f2bedd83ec794976')

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
