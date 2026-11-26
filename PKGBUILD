# Maintainer: Zentino <Zylsjsp@gmail.com>
_name=certbot-pkcs12
pkgname=python-${_name}
pkgver=0.4.0
pkgrel=1
pkgdesc="PKCS#12 installer plugin for Certbot and Let's Encrypt"
arch=('any')
url="https://github.com/nasa-gcn/certbot-pkcs12"
license=('Apache-2.0')
depends=('certbot' 'python-cryptography>38.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-setuptools-scm')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nasa-gcn/certbot-pkcs12/archive/refs/tags/v${pkgver}.tar.gz")
source=("${_name}::git+https://github.com/nasa-gcn/certbot-pkcs12/#tag=v${pkgver}")
sha256sums=('bcb0a46aaeda1c287222cb068ccd8bfa451c41d6247e984060bf5040dae7dba1')

# pkgver() {
#   cd "$_name"
#   git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
	cd "${_name}"
	python -m build --wheel --no-isolation
}


package() {
	cd "${_name}"
	python -m installer --destdir="${pkgdir}" dist/${_name//-/_}-${pkgver}*.whl
}
