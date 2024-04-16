# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.18.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('2eaabde9a74c4dce87e338ed2c33b555f3159ca2ea63346842f3df770cf3211a')

build() {
	cd $srcdir/$upstream_name-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $srcdir/$upstream_name-$pkgver
	PYTHONPATH=src:$PYTHONPATH make test
}

package() {
	cd $srcdir/$upstream_name-$pkgver
	python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
