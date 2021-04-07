# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=1.4.3
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('hddtemp' 'hdparm' 'python' 'python-daemon' 'python-setuptools')
optdepends=('smartmontools: for alternative temperature probing using smartctl')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ff58711e0abda55677525202734012e3662bcbef4037ea01dc29b4a55cd3b3b376c267a0341beb3f669a6a6a73ee369740be477adddef327a432d2e91d740a3f')

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
