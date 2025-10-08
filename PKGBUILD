# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-sdbus
pkgver=0.14.1
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
sha256sums=('691af2fdd3f0dc8c8d52dae819d0ba1c839d675b48433b169dfe54d8cf45bcf9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
