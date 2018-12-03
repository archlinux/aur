# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zedenv-git
pkgver=r158.5516421
pkgrel=1
pkgdesc="Utility to manage ZFS Boot Environments"
arch=('any')
url="http://github.com/johnramsden/zedenv"
license=('BSD' 'custom:BSD 3 clause')
depends=('zfs' 'python' 'python-setuptools' 'python-click' 'python-pyzfscmds>=0.1.4')
makedepends=('git' 'python-pip')
source=('zedenv::git+https://github.com/johnramsden/zedenv#branch=master')
md5sums=('SKIP')
conflicts=('zedenv')
provides=('zedenv')
optdepends=('zedenv-grub: zedenv plugin for GRUB')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -d "${pkgdir}/usr/share/license/${pkgname}"
    install -m 755 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
