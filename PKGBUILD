# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-simpleeval
_name=${pkgname#python-}
pkgver=0.9.10
pkgrel=2
pkgdesc="A simple, safe single expression evaluator library."
arch=(any)
url="https://github.com/danthedeckie/simpleeval"
license=(MIT)
depends=(
	python
)
makedepends=(
	python-setuptools
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/danthedeckie/simpleeval/${pkgver}/LICENCE"
)
sha256sums=(
	692055488c2864637f6c2edb5fa48175978a2a07318009e7cf03c9790ca17bea
	91efc982fa45add893fa80ec3ab1524f31e50a1386adba1424ddcf432359850a
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
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
