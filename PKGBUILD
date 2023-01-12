# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-selection
_pkg="${pkgname#python-}"
pkgdesc="API to extract content from HTML & XML documents"
pkgver=0.0.21
pkgrel=1
arch=('any')
url='https://github.com/lorien/selection'
license=('MIT')
depends=('python-lxml')
optdepends=('python-pyquery')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('a136018db3fca4ef05ff420dd41a27789b268375aa2b17a8077faa68e671aa6d')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
