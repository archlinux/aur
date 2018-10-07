# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-executor-python37
_name=executor
pkgver=21.0
pkgrel=1
pkgdesc="Programmer friendly subprocess wrapper"
arch=(any)
url="https://github.com/xolox/python-executor"
license=(MIT)
depends=(
	python
	python-coloredlogs
	python-fasteners
	python-humanfriendly
	python-property-manager
	python-six
)
makedepends=(
	python-setuptools
)
conflicts=(
	python-executor
)
provides=(
	python-executor
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
	462d1b637f1a7a557f86421791eb5cdb25f2811f97dc9b6d9a4bb46419f2793a
)

prepare() {
	cd "${_name}-${pkgver}"

	# don't try to install missing dependencies, error instead
	cat >> setup.cfg <<EOF
[easy_install]
find_links = file:///dev/null
index_url = file:///dev/null
EOF
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
