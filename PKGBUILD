# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.2.7
pkgrel=2
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('python' 'python-daemon' 'hdparm' 'hddtemp')
replaces=('python-hddfancontrol')
makedepends=('python-setuptools')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fd97b7c058dbbbde48d127e874b2e833e827abed9a12eb588e6d7838aa78a344b0a0f78bdfb1f7ea8fd92e85b926677242e744bb9126604e1cd51d5a7aa5f667')

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
