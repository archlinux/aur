# Maintainer: hashworks <mail@hashworks.net>
pkgname=certbot-dns-hetzner-git
_pkgname="${pkgname%-git}"
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner DNS API"
pkgver=v1.0.3.r0.g0b5f4d2
pkgrel=2
arch=("any")
url="https://github.com/ctrlaltcoop/certbot-dns-hetzner"
license=("APACHE")
depends=("certbot")
makedepends=("python-setuptools" "git")
checkdepends=("python-pytest" "python-requests-mock")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}"
	PYTHONPATH=. pytest
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}" -O1 --skip-build
}
