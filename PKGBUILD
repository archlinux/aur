# Maintainer: yangon99 <yangon99_all@outlook.com>

pkgname=clash-premium-bin
pkgver=2020.06.27
pkgrel=1
pkgdesc="Close-sourced pre-built Clash binary with TUN support"
provides=('clash')
conflicts=('clash' 'clash-tun' 'clash-dev-git')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Dreamacro/clash/releases/tag/premium"
license=('unknown')
depends=('glibc')
install=${pkgname}.install
source=("clash@.service"
        "clash_user.service")
sha512sums=('3d4b599a972caab7238f405d57e8ec74f9d0f51bc2b51f6656305f3a46aecd4d1d5c10a16415c3c158df1e0248f0aad327ddefc168d480c2674cec29602a31a0'
            'c08d9f25b8c7656b72da975c2ab580adfc8834a61c2dfec8296f19b6964460d12cad2100becadb7478cbccffa7c4805dbed80847c2a30075fc9fb31dee60ebe2')
source_i686=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-${pkgver}.gz")
sha512sums_i686=('e8c5a774e2be72ef13fb3349e9c4ead61c8eb4f1ac3b481e1eb9ee3d373efc28b462b7af779bfae8d02f7db6b8b6d827a32b844d4096459c4ca53ec0055e582c')

source_x86_64=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz")
sha512sums_x86_64=('a4de4237cba96b450c0e26d3a68b5309487e2d5279c82a04a2644a324c4e3be1247ec340ad87e9283eaa4867a4442fd589cfc70ce64e03180fe0e92ba9a6daad')

source_arm=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv5-${pkgver}.gz")
sha512sums_arm=('92a79f6df43e24348def4615e970238fa665be3fef5dc66f4485b3552266dc4304144ad570e6e8e67aa9232309285f1bccece8d7f2309432e40b69d5a53c4558')

source_armv6h=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv6-${pkgver}.gz")
sha512sums_armv6h=('1a17285b061e65b137c108e9747f3fd1832fae9cd314f2dcc78a44da638faf8fe289e399e7a81eb8301f15d0ef4a24586e0f5d9721cbe48a22fe2a65a0c72224')

source_armv7h=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv7-${pkgver}.gz")
sha512sums_armv7h=('2619f540efb99701af34b22db5b7f78dd03e0f272f60872441c021ce07fcab752823946d45bb6bcfe2d8ef34c639ccbcc15a6704883df9365fbdd6809b71276e')

source_aarch64=("${pkgname}-${CARCH}-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-${pkgver}.gz")
sha512sums_aarch64=('a4de4237cba96b450c0e26d3a68b5309487e2d5279c82a04a2644a324c4e3be1247ec340ad87e9283eaa4867a4442fd589cfc70ce64e03180fe0e92ba9a6daad')

prepare() {
    cd "${srcdir}"
    gunzip -kfN "${pkgname}-${CARCH}-${pkgver}.gz"
}

package() {
    if [ $CARCH = "i686" ]; then
        _arch='386'
    elif [ $CARCH = "x86_64" ]; then
        _arch='amd64'
    elif [ $CARCH = "arm" ]; then
        _arch='armv5'
    elif [ $CARCH = "armv6h" ]; then
        _arch='armv6'
    elif [ $CARCH = "armv7h" ]; then
        _arch='armv7'
    elif [ $CARCH = "aarch64" ]; then
        _arch='armv8'
    fi
    install -Dm755 "clash-linux-${_arch}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "${srcdir}/clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "${srcdir}/clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}