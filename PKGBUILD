# Maintainer: Philipp A. <flying-sheep@web.de>

_name=spectate
pkgname=python-$_name
pkgver=1.0.1
pkgrel=2
pkgdesc='Observe the evolution of mutable data types like lists, dicts, and sets.'
arch=(any)
url="https://github.com/rmorshea/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('49a2dde0962fcecf120cb361cc293989489078eb29ba1d8c3d342a741e898b7e')

build() {
	cd "$srcdir/$_name-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
