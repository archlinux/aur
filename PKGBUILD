# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='6.0.2'
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
sha512sums=('046e6af5d4f3bd26e21d0ba1c5f7e4dc72aa05fdbc3a4e950ec6a38628b235bc057e88f315a82892dbe7dbbcd556407e1835ccb4fe0a7b0e70eb065dcbccc899')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
