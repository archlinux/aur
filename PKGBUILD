# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-ticktick-py
_reponame=ticktick-py
pkgver=2.0.3
pkgrel=4
pkgdesc="Unofficial API library for interacting with TickTick.com"
url="https://github.com/lazeroffmichael/ticktick-py"
arch=(any)
license=('MIT')
depends=('python' 'python-requests' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'cython' 'git')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lazeroffmichael/ticktick-py/archive/v${pkgver}.tar.gz"
	"password-login.patch::https://github.com/btw04/ticktick-py/commit/2d8d874e2d97f6c43d4fe318665fbe4a7e18eb72.patch"
)
sha256sums=('c63c35434a77c4f03246ba4f24ec719cfa9f6b7602758105d14bac3fff39492b'
            '9d362c34660323500f9fd1d8c4835c6dac3f06a8396f4762cad806e2932ac7b5')

prepare() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	patch -p1 < "${srcdir}/password-login.patch"
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
