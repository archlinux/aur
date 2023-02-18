# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.10.3
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python-tomli' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-poetry' 'python-installer' 'python-wheel')
# checkdepends=('python-parameterized' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('112beaf21e3d5569950b99162a1de003fa885fabee9e450757a6b874be914877')

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
