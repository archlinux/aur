# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='6.0.1'
pkgrel=1
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=(
	'python-asgiref'
	'python-beautifulsoup4'
	'python-boto3'
	'python-botocore'
	'python-django'
	'python-freezegun'
	'python-jinja'
	'python-markupsafe'
	'python-pillow'
	'python-requests'
	'python-setuptools'
	'python-willow'
)
makedepends=('python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('c366833c5eb0b827eefdbddfd3144a8fe7d31001b6fde79b212997174a361c6ef084a429da1dc4a1b8ef7ea9dc5359eaa05f325b6839469a283a39e522792112')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
