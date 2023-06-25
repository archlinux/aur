# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=1.5.1
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('hddtemp' 'hdparm' 'python' 'python-daemon')
optdepends=('smartmontools: for alternative temperature probing using smartctl')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8d0545422c46038c934a39b72249e457bd268badea1aed75993aa533cfbef4c6acc73b00eee747fce526f0a9cccc62921f9b13336cfd66f4e417cefd82b776fc')

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
