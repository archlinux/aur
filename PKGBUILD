# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=container-magic
_name=${pkgname//-/_}
pkgver=5.4.2
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
sha256sums=('ef7231accb5316f8bda7c53a7c7ab89cb1217933caa0167eebe1939c98ed8616'
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
