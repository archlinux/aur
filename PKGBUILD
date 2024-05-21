# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.14.0
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/d6/91/3e4e63fb6b6747010c03bf0f172f0391ab8ec34f24ab55fa946ed8d7bd51/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('0c4ede64bc837bf90e5a5e2dc46237078a571ce79f9eb7239cfc78b721cc23b2')

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
