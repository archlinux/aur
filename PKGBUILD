# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-binary
_pkg="${pkgname#python-}"
pkgver=1.0.2
pkgrel=1
pkgdesc="Easily convert between binary and SI units"
arch=('any')
url="https://github.com/ofek/binary"
license=('MIT' 'Apache-2.0')
depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-vcs'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("git+${url}.git#commit=v$pkgver")
sha256sums=('dbd20271b5cda43f807fc9676bd55c75f193163632242b38dedd46a0037418ea')

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg"
	pytest -x
}

package() {
	cd "$_pkg"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
