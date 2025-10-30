# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.14.1
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/taskipy/taskipy"
license=('MIT')
depends=('python-tomli' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-poetry' 'python-installer' 'python-wheel')
# checkdepends=('python-parameterized' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/taskipy/taskipy/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4d740ed123e56ec096139a9ae9532d0caa290a31e7dcf4a4f4d25118f308852d')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

# check() {
# 	cd "$_pkgname-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
