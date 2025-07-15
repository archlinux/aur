# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-sdbus
_reponame=sdbus
pkgver=0.14.0
pkgrel=1
pkgdesc="Modern Python library for D-Bus"
url="https://github.com/python-sdbus/python-sdbus"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
	'glibc'
	'systemd-libs'
	'python'
)
optdepends=(
	'python-jinja: for code generator'
	'python-sphinx: for autodoc'
)
makedepends=(
	'git'
	'python-poetry'
	'python-setuptools'
)
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('41d61b76cc05a9ea41d10d70a11e9f9a86ed95f40f713630c5e18340e0e4c76f')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
