# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.2.7
pkgrel=1
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('python' 'python-daemon' 'hdparm' 'hddtemp')
replaces=('python-hddfancontrol')
makedepends=('python-setuptools')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2a0eb2b48e2f008f7b48808c069a24f0')

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 systemd/hddfancontrol.service "$pkgdir/usr/lib/systemd/system/hddfancontrol.service"
    install -Dm 644 systemd/hddfancontrol.conf "$pkgdir/etc/conf.d/hddfancontrol"
}
