# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-sdbus
pkgver=0.14.0
pkgrel=2
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
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/python-sdbus/python-sdbus/archive/${pkgver}.tar.gz"
)
sha256sums=('b51aefe18037ab7043fd08e06c1d58a6105f7830b03a240c7ee95591060c45e1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
