# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=22.7.0
pkgrel=1
pkgdesc='OSP Server for openvas'
arch=('x86_64')
url="https://github.com/greenbone/ospd-openvas"
license=('GPL')
depends=('openvas-scanner' 'python-redis' 'python-psutil' 'python-packaging' 'python-lxml' 'python-defusedxml' 'python-deprecated' 'python-paho-mqtt' 'python-gnupg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('python-ospd-openvas')
conflicts=('python-ospd-openvas')
groups=('greenbone-vulnerability-manager')
backup=("etc/default/ospd-openvas")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd-openvas/archive/v${pkgver}.tar.gz"
        "ospd-openvas"
        "ospd-openvas.service")
sha512sums=('5a2c533589dc7a27a1be1b834243054eaf1bdb250fc41a98b0b35e6e60b8a2793e0e1d7dcd8bbf638bf23da1636efb5a80310df75727990768035743300ca8b1'
            '3461820543ac6bc0cd50026023a6271e015123366fc44ce66ead1221d52c9e534063881f3b46a50a6e43ec9caff697376c35f1ce2cd22944e7b58f02070a78a8'
            'ddaa5ad183265df4a89661acde7f0c8a5d1fd4c0748e3ca2dd267d3e7e05e6975a62023833bdd048ab97076c9ec839e7ad2fd463ef16b246e5813e328956b50e')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -d $pkgdir/etc/default
    install -m 644 $srcdir/ospd-openvas $pkgdir/etc/default
    install -d $pkgdir/usr/lib/systemd/system
    install -m 644 $srcdir/ospd-openvas.service $pkgdir/usr/lib/systemd/system
}

