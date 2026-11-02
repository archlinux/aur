# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-archive-all
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
pkgver=1.24.0
pkgrel=1
url=https://github.com/Kentzo/git-archive-all
license=(custom:MIT)
depends=(git)
makedepends=(python-build python-installer python-wheel python-setuptools)
conflicts=(git-archive-all-git)
arch=(any)
source=("${url}/releases/download/${pkgver}/${pkgname//-/_}-${pkgver}.tar.gz")
b2sums=('3f97b0020b1fa28d4b2ba38d8b95511a384cb8a89130f5a5ee72754d95a411210b8e730b75c87f9579c616755becba6d3b06220a665e7953148998b0313524f0')

build () {
	cd "${pkgname//-/_}-${pkgver}"
	python -m build --wheel --no-isolation
}

package () {
	cd "${pkgname//-/_}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
