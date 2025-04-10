# Maintainer: tyrolyean <drain@semi-professional.net>

_pkgname="aiomqtt"
pkgname=python-${_pkgname}
pkgver=2.3.2
pkgrel=1
pkgdesc="The idiomatic asyncio MQTT client"
arch=(x86_64)
url="https://github.com/empicano/${_pkgname}"
license=('BSD')
depends=('python-paho-mqtt' 'python-poetry-dynamic-versioning')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=(
	"git+${url}.git#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

build() {
	cd "${_pkgname}"

	python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 README.md
}

