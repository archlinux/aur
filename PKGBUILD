# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=1.4.2
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
sha512sums=('476321266ddd016af971f470fe94aa422bdaec41b0bcb9bcc85b6a8528b6dcda9a2081360fdf34e4428bb3924261d622dd705cefb5fd016c506d783cffdc3e0f')

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
