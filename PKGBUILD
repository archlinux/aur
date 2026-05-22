# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=container-magic
_name=${pkgname//-/_}
pkgver=5.3.0
pkgrel=1
pkgdesc="Container development tools"
arch=('any')
url="https://github.com/markhedleyjones/container-magic"
license=('MIT')
depends=(python python-pyyaml python-jinja python-click python-requests python-pydantic)
makedepends=(python-build python-installer python-wheel python-setuptools)
#conflicts=(cm)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/markhedleyjones/container-magic/v$pkgver/LICENSE")
sha256sums=('aea12bc9315ade9b82628fe47d05b3c83237de1aad1a87ac43f125dc3a22424e'
            '21aca9786832c0545aeb9e32c5e385acdbfbdcf2dcf141d59923da4864670dd0')

build() {
	cd "${_name}-${pkgver}"
	python3 -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
