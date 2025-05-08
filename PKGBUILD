# Maintainer: Zentino <Zylsjsp@gmail.com>
_name=certbot-pkcs12
pkgname=python-${_name}
pkgver=v0.2.1.r4.gf67db95
pkgrel=1
pkgdesc="PKCS#12 installer plugin for Certbot and Let's Encrypt"
arch=('any')
url="https://github.com/nasa-gcn/certbot-pkcs12"
license=('Apache-2.0')
# depends=('certbot' 'python-pyopenssl<24.1')
depends=('certbot' 'python-cryptography>38.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-setuptools-scm')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nasa-gcn/certbot-pkcs12/archive/refs/tags/v${pkgver}.tar.gz")
source=("${_name}::git+https://github.com/zent1n0/certbot-pkcs12/#branch=feat/cryptography-backend")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_name}"
	python -m build --wheel --no-isolation
}


package() {
	cd "${_name}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
