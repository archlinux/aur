# Maintainer: tyrolyean <drain@semi-professional.net>

_pkgname="systemctl-mqtt"
pkgname=python-${_pkgname}
pkgver=3.0.0
pkgrel=1
pkgdesc="MQTT client triggering & reporting shutdown on systemd-based systems"
arch=(any)
url="https://github.com/fphammerle/${_pkgname}"
license=('GPL-3.0')
depends=('python-aiomqtt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
	"https://github.com/fphammerle/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'120653c1584de4588559f94c8100173ce1fc2a4800537889e8e0a3c94e656a7f'
)

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -t "${pkgdir}/usr/share/doc/${pkgname}" \
		-vDm644 README.md
}

