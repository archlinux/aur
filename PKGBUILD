# Maintainer: Zentino <Zylsjsp@gmail.com>
_name=certbot-pkcs12
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="PKCS#12 installer plugin for Certbot and Let's Encrypt"
arch=('any')
url="https://github.com/nasa-gcn/certbot-pkcs12"
license=('Apache-2.0')
depends=('certbot' 'python-cryptography>38.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-setuptools-scm')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nasa-gcn/certbot-pkcs12/archive/refs/tags/v${pkgver}.tar.gz")
source=("${_name}::git+https://github.com/nasa-gcn/certbot-pkcs12/#tag=v${pkgver}")
sha256sums=('d6385fcc500ebd85cf348947eb07d1b8085dc67e0241874168db2344db274593')

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
