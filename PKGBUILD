# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.3.1
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.4' 'python-android-backup-tools-git' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-pycryptodomex' 'python-pretty-cron' 'python-pytz' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz"
        'cryptodome-typing.patch')
sha512sums=('324ecc5fa3d049c3d59529755575ed1d179193631b28eb0999c28c62ead85c6cf1604d35c97a186bd3521bb05cc72fdf9352c6aa527ed064404a7a3c3183a7ba'
            'c3c402edba82a70a7a91d3250e4fed1ed4f1316ab7e785663994c8722107703461fda0ac55f33935d52be453498f3118d6d0c2bcfd4ee21415f867643a9c115c')

prepare() {
	cd ${pkgname}-${pkgver}
	patch -p1 -i ../../cryptodome-typing.patch
}

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
