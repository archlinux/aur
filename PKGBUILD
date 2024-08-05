# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: frankspace <frank@frankspace.com>
# Contributor: wenLiangcan <boxeed@gmail.com>

pkgname='pip2pkgbuild'
pkgver='0.3.9'
pkgrel=3
pkgdesc="Create PKGBUILD files for Python modules fetched with PIP"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=(
	'python>=3.12'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
license=('MIT')
conflicts=("python2-$pkgname")
arch=('any')
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'imp_repacement.patch'
)
b2sums=('8080e8bf17e8401cfb9a8aa2edb3c7bbd6a2905ea1bb16edf0250fada248b3180493c0ef4fc9c2b050efd6a077e27081db7e3cd326092efbd7e5fbe24c142caf'
        '65d287bde2396e85b83ce4a7265c9082246e6b3b32b290b9526a1caffa35750af3617c99e2b5b573130480c7fc3bbc64decb1e34d68ee9f7801f296d2e6dbb55')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch < "${srcdir}/imp_repacement.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
