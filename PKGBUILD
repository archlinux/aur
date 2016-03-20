# Maintainer: Pritunl <contact@pritunl.com>

pkgname=pritunl-git
_gitname=pritunl
pkgver=1.3.662.15
pkgrel=1
pkgdesc="Enterprise VPN Server"
arch=("any")
license=("custom")
url="https://github.com/${_gitname}/${_gitname}"
depends=("python" "python2" "python2-flask" "python2-pyopenssl" "python2-pymongo" "net-tools" "iproute2" "openvpn" "python2-netifaces" "python2-boto")
optdepends=("mongodb")
makedepends=("python2-distribute" "python2-flask" "python2-pyopenssl" "python2-pymongo" "git")
provides=("${_gitname}")
conflicts=("${_gitname}")
install=${_gitname}.install
source=("git+https://github.com/${_gitname}/${_gitname}")
sha256sums=("SKIP")
options=("emptydirs")
backup=("etc/${_gitname}.conf" "var/lib/${_gitname}/${_gitname}.db" "var/log/${_gitname}.log" "var/log/${_gitname}.log.1")

pkgver() {
	cd $_gitname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$_gitname"
	python2 setup.py build
}

package() {
	cd "$_gitname"
	mkdir -p "${pkgdir}/var/lib/${_gitname}"
	python2 setup.py install --root="${pkgdir}" --prefix=/usr --no-upstart
}
