# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyrserve
pkgname=python-rserve
pkgver=1.0.4
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=(any)
url="https://github.com/ralhei/$_name"
license=(MIT)
provides=(python-pyrserve)
depends=(python python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('29c57f375afc38642cdea7df477b9f565f07805656aa1066bba8cfcb04dfa61a')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm "$pkgdir/usr/requirements"*.txt
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
