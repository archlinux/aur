# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=python-dohq-artifactory
_pkg="${pkgname#python-}"
pkgver=0.8.4
pkgrel=2
pkgdesc='Python interface library for JFrog Artifactory'
license=('MIT')
arch=('any')
url="https://github.com/devopshq/artifactory"
depends=('python-requests' 'python-pyjwt' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('4c4e31153a771341cd6d21d766e095701aeddcb2da431b502f357258070b443f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
