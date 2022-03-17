# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=mosmetro-python
pkgver=0.1.1
pkgrel=2
pkgdesc="A script for automatic authorization in Moscow Transport free networks"
arch=('any')
url='https://github.com/mosmetro-android/mosmetro-python'
license=('GPL3')
depends=('python-requests' 'python-furl' 'python-user_agent' 'python-beautifulsoup4')
makedepends=('python-setuptools')
optdepends=('networkmanager: for auto-enable hook')
source=("${url}/archive/${pkgver}.tar.gz"
        'mosmetro-python.sh')
sha256sums=('91b0262fba26d93f956e1535538a95596d1a4ac6f7587b7d838612365d714d2a'
            '3eb717c73ab5ede1b2b0fea55ca7761fd61fb891bedecd93d0c3603cf0258a07')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm755 'mosmetro-python.sh' -t "${pkgdir}/usr/lib/NetworkManager/dispatcher.d/"

	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
