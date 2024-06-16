# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=1.6.2
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('hddtemp' 'hdparm' 'python' 'python-daemon')
optdepends=('smartmontools: for alternative temperature probing using smartctl')
makedepends=('python-setuptools')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1b974682e1a617049b1fbb6a3a9983e8f0e2c607284862468cb61e065cc2d3c52ca3a92c1d3fc2a02b5b9501e0a345b40f6a2a60c675889a40e4115890080e59')

check() {
    cd "${pkgname}-${pkgver}"
    python -m unittest discover -v
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 systemd/hddfancontrol.service "${pkgdir}/usr/lib/systemd/system/hddfancontrol.service"
    install -Dm 644 systemd/hddfancontrol.conf "${pkgdir}/etc/conf.d/hddfancontrol"
}
