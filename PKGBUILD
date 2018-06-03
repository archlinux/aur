# Maintainer: desbma
pkgname=hddfancontrol
pkgver=1.2.8
pkgrel=2
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('python' 'python-setuptools' 'python-daemon' 'hdparm' 'hddtemp')
replaces=('python-hddfancontrol')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b386a193421b880355ab4b91c0fbe12f45909a983fd79efa53b4def324985b4f0a26b81ade6ca4cdaeae1a914d0a485a0046c5110c7b691d8e67b00360fa864d')

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
