# Maintainer: Gregory Werbin <outthere@me.gregwerbin.com>

_pkgname=hyrule
pkgname="hy-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc='A utility library for the Hy programming language'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(MIT)
depends=(python hy)
makedepends=(python-setuptools python-wheel python-build python-installer)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4f72eb791b0551d0aab9113f982abb617c37b2d8d04af4a223b05939baf2a97c')
b2sums=('69379197e345c8254b918ee64c01691f336024ad6fd326c1dc1a60b06184f9f226a7e8e935269a958c70590095407f2621747130753aea20a6bd031ce2d821c0')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
