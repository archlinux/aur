# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.14.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('05ac5cf1404e269c4a7aa9664be4c5fbe6ba0bb25787d4a314ecb84f25a86ec4')

build() {
	cd $srcdir/$upstream_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$upstream_name-$pkgver
	python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
