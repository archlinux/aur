# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-wheezy-captcha
_pkg="${pkgname#python-}"
_pkg="${_pkg/-/.}"
pkgver=3.0.2
pkgrel=1
pkgdesc='Lightweight CAPTCHA library'
arch=('x86_64')
url="https://github.com/akornatskyy/wheezy.captcha"
license=('MIT')
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('3ddb4e86854ea2942c5f6ada3ea8743fc99e33cfcccac80ab087b6ec736d977b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
