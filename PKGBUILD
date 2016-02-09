# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Boyan Ding <stu_dby@126.com>

_pkgname=bbswitch
_extramodules=extramodules-4.5-r500v
_kernver=$(cat /usr/lib/modules/${_extramodules}/version)
pkgname=bbswitch-r500v
pkgver=0.8
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-r500v"
arch=('i686' 'x86_64')
url="https://github.com/Bumblebee-Project/${_pkgname}"
license=('GPL')
depends=('linux-r500v>=4.5c1' 'linux-r500v<4.6rc1' 'xz')
makedepends=('linux-r500v-headers>=4.5rc1' 'linux-r500v-headers<4.6rc1')
provides=(${_pkgname})
install=${pkgname}.install
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('76cabd3f734fb4fe6ebfe3ec9814138d0d6f47d47238521ecbd6a986b60d1477')

build() {
    cd ${_pkgname}-${pkgver}
    make KDIR=/lib/modules/${_kernver}/build
}

package() {
    install -Dm644 "${_pkgname}-${pkgver}/${_pkgname}.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/${_pkgname}.ko"
    xz -9 "${pkgdir}/usr/lib/modules/${_extramodules}/${_pkgname}.ko"                      
}
