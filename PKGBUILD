# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-sdbus-notifications
_reponame=sdbus-notifications
pkgver=1.0.2
pkgrel=1
pkgdesc="Freedesktop Notifications binds for python-sdbus"
url="https://github.com/python-sdbus/python-sdbus-notifications"
arch=('any')
license=('LGPL-2.1-or-later')
depends=(
	'python-sdbus'
)
optdepends=(
)
makedepends=(
	'git'
	'python-poetry'
	'python-setuptools'
)
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('21443de84d218fb0ce01b50fd47d4e84ba4f4ffbc5fcd1be729be7088fd276c2')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ./COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
