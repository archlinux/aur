# Maintainer: Tony Lambiris <tony@libpcap.net>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-pynvim
_pkgname=${pkgname#*-}
pkgver=0.4.3
pkgrel=1
pkgdesc='Python client for Neovim.'
arch=('any')
url='https://github.com/neovim/pynvim'
license=('Apache')
depends=('python2' 'python2-msgpack' 'python2-greenlet' 'python2-trollius')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
provides=('python2-neovim')
replaces=('python2-neovim')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/neovim/python-client/archive/${pkgver}.tar.gz")
sha256sums=('e7c9de44b0201ad874a608270b7a9b10fd48bda65f49bada05815d973ca79391')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python2 setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python2 setup.py pytest
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	python2 setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
}
