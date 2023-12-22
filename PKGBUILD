# Maintainer: Maximilian Knespel <mxmlnknp at gmail dot com>

_program_name="rapidgzip"
pkgname="python-${_program_name}"
pkgver=0.11.1
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
source=("${pkgname}-${pkgver}${_pkg_ext}::https://files.pythonhosted.org/packages/98/0a/021a8f5a55e76fe1b5e22b2bf4cb5b79eb8bd545c4738b40f0fb1fe07059/${_program_name}-${pkgver}${_pkg_ext}")
sha256sums=('a5c28ef41a2f9140e546313c3194047d34aeb55301ffd6dec80c8fdef0a13141')

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
