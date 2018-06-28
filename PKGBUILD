# Maintainer: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=0.3.1
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and some steam related websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.6' 'python-aiohttp' 'python-gobject' 'stlib') 
makedepends=('python-setuptools' 'python-certifi')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/releases/download/v${pkgver}/$pkgname-$pkgver.linux.tar.gz"
        'fix_noi18n.patch')
sha256sums=('1facaa97909f8271d88deb06f0c67a873597bcc40e3306ef88a4cc5cb4874dd3'
            'c03494d29a1feaceb3ebc06c3e9112f96a7e92f6d84d729a7b9b349d9e9e165b')

prepare() {
    cd ${pkgname}-${pkgver}.dev1
    patch -uN setup.py ../fix_noi18n.patch || return 1
}

build() {
    cd ${pkgname}-${pkgver}.dev1
    python setup.py build 
}

package() {
    cd ${pkgname}-${pkgver}.dev1
    python setup.py install --skip-build --optimize=1 --root=$pkgdir
}


