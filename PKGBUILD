# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.2.10
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('python' 'python-setuptools' 'python-daemon' 'hdparm' 'hddtemp')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f1529150154170692a9fdbdbd807e73dc867760196e0d97d5a380af7bb03c29def87125ef1dcb0e8a97f10adc38e6b7fd495a1f7d6e39531b6b920e4c2b1cf4d')

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 systemd/hddfancontrol.service "${pkgdir}/usr/lib/systemd/system/hddfancontrol.service"
    install -Dm 644 systemd/hddfancontrol.conf "${pkgdir}/etc/conf.d/hddfancontrol"
}
