# Maintainer: Harry Youd <harry at youd dot family>
pkgname=certbot-dns-hetzner-cloud
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner Cloud API"
pkgver=1.0.4
pkgrel=1
arch=("any")
url="https://github.com/rolschewsky/certbot-dns-hetzner-cloud"
license=("MIT")
depends=("certbot" "python-tldextract" "python-hcloud")
checkdepends=("python-pytest")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('489b480eb535258b3a240540818cd0f28ed571135aaaee76453a3a1ca0e1eeb0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	pytest
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
