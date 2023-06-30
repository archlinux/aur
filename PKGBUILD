# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-archive-all
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
pkgver=1.23.1
pkgrel=1
url=https://github.com/Kentzo/git-archive-all
license=(custom:MIT)
depends=(git)
makedepends=(python-build python-installer python-wheel python-setuptools)
conflicts=(git-archive-all-git)
arch=(any)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('63699ab19e0862577e4296bf48160cddcdfeb9fdbf7fa4854769bf7c3faed617ce9af5312a3d119dff77ce354c783e480c70e2135bce076f6ed85f4a38e61f08')

build () {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package () {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
