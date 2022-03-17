# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=mosmetro-python
pkgname=${_pkgbase}-git
pkgver=0.1.1.r3.g3e31949
pkgrel=3
pkgdesc="A script for automatic authorization in Moscow Transport free networks (git version)"
arch=('any')
url='https://github.com/mosmetro-android/mosmetro-python'
license=('GPL3')
depends=('python-requests' 'python-furl' 'python-user_agent' 'python-beautifulsoup4')
makedepends=('python-setuptools')
optdepends=('networkmanager: for auto-enable hook')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git"
        'mosmetro-python.sh')
sha256sums=('SKIP'
            '3eb717c73ab5ede1b2b0fea55ca7761fd61fb891bedecd93d0c3603cf0258a07')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgbase}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm755 'mosmetro-python.sh' -t "${pkgdir}/usr/lib/NetworkManager/dispatcher.d/"

	cd "${_pkgbase}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
