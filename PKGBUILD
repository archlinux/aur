# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=dmenu-extended
_name=${pkgname//-/_}
pkgver=1.4.3
pkgrel=1
pkgdesc="An extension to dmenu for quickly opening files and folders."
arch=('any')
url="https://github.com/markhedleyjones/dmenu-extended"
license=('MIT')
depends=(python dmenu)
makedepends=(python-build python-installer python-wheel python-setuptools)
conflicts=(dmenu-extended-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/markhedleyjones/dmenu-extended/$pkgver/LICENSE")
sha256sums=('1272e75ef96c73c78bbe67777b0f7e124ef6d3dd6d118728555e8118ea12d179'
            '40c707dbb656d7507154510dee54b3a0aeefdd0331aa1736c94d6aa4d4049b6b')

build() {
	cd "${_name}-${pkgver}"
	python3 -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
