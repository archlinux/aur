# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=linux-rockchip-ayufan-headers
_pkgname="${pkgname#linux-}"
_pkgname="${_pkgname%-headers}"
_kname="${_pkgname}-gfd4492386213"
pkgver=4.4.202
pkgrel=1237
arch=('aarch64')
url="https://github.com/ayufan-rock64/linux-kernel"
license=('GPL2')
pkgdesc="Header files and scripts for building modules for linux kernel - rockchip ayufan"
provides=("linux-headers=${pkgver}")
conflicts=('linux-headers')
source=("https://github.com/ayufan-rock64/linux-kernel/releases/download/${pkgver}-${pkgrel}-${_pkgname}/linux-headers-${pkgver}-${pkgrel}-${_kname}_${pkgver}-${pkgrel}-${_pkgname}_arm64.deb")
sha256sums=('1927ace8b2dc735937bfee06d2083ee51660680b9d5c8729e9c655cb219b08f2')

prepare() {
    cd $srcdir
    mkdir -p ${_kname}-${pkgver}-${pkgrel}
    tar xaf data.tar.xz -C ${_kname}-${pkgver}-${pkgrel}
}

package() {
    # kernel sources
    install -d "$srcdir/usr/src/linux-headers-${pkgver}-${pkgrel}-${_kname}" "$pkgdir/usr/src/linux-headers-${pkgver}-${pkgrel}-${_kname}"
    install -d "$pkgdir/lib/modules/${pkgver}-${pkgrel}-${_kname}"
    ln -sf "/usr/src/linux-headers-${pkgver}-${pkgrel}-${_kname}" "$pkgdir/lib/modules/${pkgver}-${pkgrel}-${_kname}/build"
}

