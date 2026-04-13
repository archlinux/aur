# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=jellex
pkgver=0.5.7
pkgrel=1
pkgdesc="TUI to filter JSON data with Python syntax"
arch=('any')
url="https://github.com/kellyjonbrazil/jellex"
license=('MIT')
depends=('jello' 'python-pygments' 'python-prompt_toolkit')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('134dcf59909fd9870795c6a9e7e8daf4e6a0613712350077f186a950fe33b338')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
