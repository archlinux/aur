# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.12.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('12079fe1d548e8712952dd1dedae2ca0f02d8e8d02da9cac230c1d2f5e3038c6')

build() {
	cd $srcdir/$upstream_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$upstream_name-$pkgver
	python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
