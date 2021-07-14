# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=python-magic-wormhole-transit-relay
pkgver=0.2.1
pkgrel=1
pkgdesc="transit Relay server for Magic-Wormhole"
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole-transit-relay"
license=('MIT')
depends=('python-twisted' 'python-autobahn')
makedepends=('python-setuptools')
checkdepends=('python-mock')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/magic-wormhole/magic-wormhole-transit-relay/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('dcc309de800d9023ff106ea7b67da4814006ee50e517570c046f2dff20573306b3d5f7c4e227186b2b6f8ff7cb71e02e41499766badf299d859a0e5628066162')
b2sums=('ffb05c716a35e688801150c3fd6de28cf557ed346091400f9eeb9335b6815425624e70d61f54be8f0a1e8bb15e874528f7cfcef1e8f0a2f8d3cd4285adb1db3a')

build() {
	cd "${pkgname#python-}-${pkgver}"
	python setup.py build
}

check() {
	cd "${pkgname#python-}-${pkgver}"
	python setup.py test
}

package() {
	cd "${pkgname#python-}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -vDm 644 docs/*.md -t "${pkgdir}/usr/share/docs/${pkgname}"
}
