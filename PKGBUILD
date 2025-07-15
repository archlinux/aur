# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-sdbus-notifications
_reponame=sdbus_notifications
pkgver=1.0.3
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
sha256sums=('92c301b8232832efc50c8c1d8789dedf83ce8fd55c1bc52d2befbeedfedfebc3')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
