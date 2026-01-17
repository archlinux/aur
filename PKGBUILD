# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-sdbus
pkgver=0.14.2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python-sdbus/python-sdbus/archive/${pkgver}.tar.gz")
sha256sums=('cf2bbc8b61941bab9ddd48ecf20bef5a47394005813ff8ae83afd2b8fb36763b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
