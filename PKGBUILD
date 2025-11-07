# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-appdaemon
_reponame=appdaemon
pkgver=4.5.12
pkgrel=1
pkgdesc="Python Apps for Home Automation"
url="https://github.com/AppDaemon/appdaemon"
arch=('any')
license=('Apache-2.0')
depends=(
	'python'
	'python-aiohttp'
	'python-bcrypt'
	'python-dateutil'
	'python-feedparser'
	'python-jinja'
	'python-pydantic'
	'python-pytz'
	'python-requests'
	'python-tomli'
	'python-tomli-w'
	'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AppDaemon/appdaemon/archive/${pkgver}.tar.gz")
sha256sums=('c0d5321012e4721f41ce19f00694d5a68b520cf572d3dd62c5d0ecb3af4f775a')

build() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
