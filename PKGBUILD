# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>

pkgname=python-ghtopdep
_pkg="${pkgname#python-}"
pkgver=0.3.14
pkgrel=1
pkgdesc='CLI tool for sorting dependents repositories and packages by stars.'
arch=('any')
url='https://github.com/github-tooling/ghtopdep'
license=('MIT')
depends=(
	'python-appdirs'
	'python-cachecontrol'
	'python-click'
	'python-github3py'
	'python-halo'
	'python-pipdate'
	'python-requests'
	'python-selectolax'
	'python-tabulate')
makedepends=('python-poetry' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('04bc9951ffc9ea04eddc4a8625da278da5947ecefb275549493e6a1da7f78f60')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
