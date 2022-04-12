# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=python-awesometkinter
_pkg=AwesomeTkinter
pkgver=2021.11.8
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('tk' 'python-pillow' 'python-bidi')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/A/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('2944e11468a437d51859f596b755c64f0df557b92b7641626fe3cfb222e4c180')

build() {
  cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
