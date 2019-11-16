# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.3.1
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
sha512sums=('edf9e07a72f539fcc9806d56ce690f787387ced02b5f49df8bc9fd5bdd51d99cd4f0537bbe0377df8f70e7764e8de08f2ee0fc5adc7fde6ef8d8671a535ce25f')

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
