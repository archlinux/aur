# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-polling
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=3
pkgdesc='Powerful polling utility in Python'
url='https://github.com/justiniso/polling'
depends=(
	'python'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-mock'
)
license=('MIT')
arch=('any')
_commit=a636656ddcde99bffd1fc0d84cd000a3e6eb7baf
# source=("git+https://github.com/justiniso/polling.git#commit=$_commit")
# b2sums=('8bf912aaf6ac9e3538d2b4ac7103ee8fb8a3eef1816f357bbadf02f5a1a6203ec7173d94ea80490651803db9e07201c677fe4ec1494f01cadd32dbc9fe8b5b3f')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3afd62320c99b725c70f379964bf548b302fc7f04d4604e6c315d9012309cc9a')

build() {
	cd "polling-$pkgver"
	python -m build --wheel --no-isolation
}

# sdist does not include tests
# check() {
# 	cd "polling-$pkgver"
# 	python -m pytest
# }

package() {
	cd "polling-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
