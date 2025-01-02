# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vy
pkgver=4.3.1
pkgrel=3
pkgdesc='Vim-like text editor in Python'
arch=('any')
url="https://github.com/vyapp/vy"
license=('MIT')
depends=('python' 'python-untwisted' 'python-jedi' 'python-rope' 'python-pygments' 'tk')
optdepends=(
	'mypy'
	'python-pyflakes'
	'vulture')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/v/vy/vy-$pkgver.tar.gz"
        'vy.desktop')
sha256sums=('551f2210aadab1d9a756b15ff014ab65cbba0af0f2641564baf1f8b84e31d99a'
            '607da5cfb483dbc6eed8ba1aa17d4f8013d3eb96d9babdef83a067d8cf8d4db6')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 "$srcdir/vy.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dvm644 vy.png -t "$pkgdir/usr/share/pixmaps/$pkgname"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
