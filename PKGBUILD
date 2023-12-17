# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=1.6.0
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
sha512sums=('c13a6ee80f6d37b383d2f081b07a61d0081d035d5638527f3487152bee601c58a41f738fdd6b71e015e1e86fcf0adb34c3e22b10fdf7c78582880ec558ea8411')

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
