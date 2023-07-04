# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

_pkgbase=hid-ite8291r3
pkgname=hid-ite8291r3-dkms-git
pkgver=r14.7ad5991
pkgrel=1
pkgdesc="Linux kernel driver for the ITE 8291 (rev 0.03) RGB keyboard backlight controller"
arch=('x86_64')
url="https://github.com/pobrn/hid-ite8291r3"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
    cp -a ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
    sed -i "s/VERSION=.*/VERSION=\"${pkgver}\"/" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
