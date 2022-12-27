# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
aur_name=python-sphinx-hawkmoth
pkgname=$aur_name-git
pkgver=0.12.0.0r.g9a77f67
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=($aur_name)
conflicts=($aur_name)
source=('git+https://github.com/jnikula/hawkmoth')
# source=('git+https://gitlab.com/bms-contrib/hawkmoth#branch=anonym')
md5sums=('SKIP')

pkgver() {
	cd "$upstream_name"
	git describe --long | sed 's/v\(.*\)\([^-]*-g\)/\1r\2/;s/-/./g'
}

build() {
	cd $srcdir/$upstream_name
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$upstream_name
	python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
