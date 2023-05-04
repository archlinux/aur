# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-naturalsort
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=4
pkgdesc="Simple natural order sorting API for Python that just works"
arch=(any)
url="https://github.com/xolox/python-naturalsort"
license=(MIT)
depends=(
	python
)
makedepends=(
	python-setuptools
)
conflicts=(
	python-natsort
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
	172b5ed6e7ba3420c08ba2ded1c52fe74878f5d769dc5d9dec2b6a53e7117356
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
