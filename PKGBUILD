# Maintainer: desbma
pkgname=python-hddfancontrol
pkgver=1.2.6
pkgrel=2
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
_gitname='hddfancontrol'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('python' 'python-daemon' 'hdparm' 'hddtemp')
makedepends=('python-setuptools')
backup=('etc/conf.d/hddfancontrol')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
md5sums=('84bfc9c067bda938a5db519cedd7ff83')

check() {
    cd "${_gitname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${_gitname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 systemd/hddfancontrol.service "$pkgdir/usr/lib/systemd/system/hddfancontrol.service"
    install -Dm 644 systemd/hddfancontrol.conf "$pkgdir/etc/conf.d/hddfancontrol"
}
