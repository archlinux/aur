# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.11.0
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/ee/76/fbbd3871a6b7a7ca7b8e3fa75a39f73c024e2025e4808e16e944f2c2fc9f/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('82ddd96ba66d25ae21c2a7a222b8b14886ccd0b6582aa7a0782c5d5215e1b3f1')

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
