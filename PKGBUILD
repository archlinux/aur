# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.2.9
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('python' 'python-setuptools' 'python-daemon' 'hdparm' 'hddtemp')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ce5fe2abda6a80ffcd4cb452df6efe1e485be7c850a071625c85b0a1ee32421002f551343385d96650f9efdc442800c087c0e8baa1fed8b785e4413467b100cd')

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
