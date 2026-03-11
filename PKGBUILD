# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=python-pyborgeous
_pkgname=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Pyborgeous is an implementation of Jorge Luis Borges' Library of Babel"
arch=('any')
url="github.com/Spacehug-zz/pyborgeous"
license=('MIT')
depends=('python' 'python-markovify')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8f8fd1956c24a8cf00b0bb891079cf989ad119faeaba476df192b617422cb7f3')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
