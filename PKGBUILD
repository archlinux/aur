# Maintainer: envolution
# Contributor: Yonggang Li <gnaggnoyil@gmail.com>
# Contributor: isbest <icoderdev@outlook.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgbasename=pyspark
pkgname=python-${_pkgbasename}
pkgver=4.0.1
pkgrel=1
pkgdesc="Apache Spark Python API"
arch=('any')
url="https://pypi.org/project/${_pkgbasename}"
license=('Apache-2.0')
depends=('python-py4j')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
optdepends=(
	'python-pandas'
	'python-pyarrow'
	'python-numpy'
	'python-grpcio'
	'python-grpcio-status'
	'python-googleapis-common-protos'
)
source=(
	"https://pypi.org/packages/source/${_pkgbasename:0:1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz"
)
sha256sums=('9d1f22d994f60369228397e3479003ffe2dd736ba79165003246ff7bd48e2c73')

build() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	env PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	env PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
