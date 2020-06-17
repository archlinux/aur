# Maintainer: hashworks <mail@hashworks.net>
pkgname=certbot-dns-hetzner
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner DNS API"
pkgver=1.0.3
pkgrel=2
arch=("any")
url="https://github.com/ctrlaltcoop/certbot-dns-hetzner"
license=("APACHE")
depends=("certbot")
checkdepends=("python-pytest" "python-requests-mock")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("86795cdfad16f7b1125dc1680041551c04a2f2d74439d1debd875dbbd8d78bda")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PYTHONPATH=. pytest
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	python setup.py install --root="${pkgdir}" -O1 --skip-build
}
