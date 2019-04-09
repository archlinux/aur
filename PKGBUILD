# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zedenv
pkgver=0.3.7
_version_suffix="beta"
pkgrel=1
pkgdesc="Utility to manage ZFS Boot Environments"
arch=('any')
url="http://github.com/johnramsden/zedenv"
license=('BSD' 'custom:BSD 3 clause')
depends=('zfs' 'python' 'python-setuptools' 'python-click' 'python-pyzfscmds>=0.1.4')
makedepends=('git' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}-${_version_suffix}.tar.gz")
md5sums=('99cf934d97c90b365ec6288ea53e83c4')
conflicts=('zedenv-git')
optdepends=('zedenv-grub: zedenv plugin for GRUB')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -d "${pkgdir}/usr/share/license/${pkgname}"
    install -m 755 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
