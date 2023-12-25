# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='5.2.2'
pkgrel=2
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=('python-asgiref' 'python-beautifulsoup4' 'python-boto3' 'python-botocore' 'python-django' 'python-freezegun' 'python-importlib-metadata' 'python-jinja' 'python-markupsafe' 'python-pillow' 'python-requests' 'python-setuptools' 'python-willow')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('48e4c29b72b0e53eb47a3178d6b0f2c699aa284d3f3a2abfd2f04f578f44b55a')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
