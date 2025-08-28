# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-appdaemon
_reponame=appdaemon
pkgver=4.5.11
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
	'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AppDaemon/appdaemon/archive/${pkgver}.tar.gz")
sha256sums=('682dcf47f82ca2ba2fd6545d59cdad74d27634c9eab5c88e06f98e5238644b52')

build() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
