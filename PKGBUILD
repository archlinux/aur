# Maintainer: yangon99 <yangon99_all@outlook.com>

pkgname=clash-premium-bin
pkgver=2020.08.16
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
source_i686=("${pkgname}-i686-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz")
source_arm=("${pkgname}-arm-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv5-${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv6-${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv7-${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-${pkgver}.gz")

sha512sums_i686=('6cce438cb7cc1e45c59ee94c3631ed12d8ebd655a666f087dd14df81f1c198f6187e3472db95198996f3513cb35f31b9701b6cd71c52944af144a68527a9f3ba')
sha512sums_x86_64=('b7a6d106a4c39fa1f89a758863df1170846015a6c112f488a53f80d81cae18ce9df0c99ee6f33d7874ab2fd9d621451ffd2b3158bffc40bb616c55ac95abd03b')
sha512sums_arm=('06ba6f455f056ef91135fa11e3b7e8f7e513ddb2c593b1a7a6140cafcc17dba5f4be71f2ec04e681d5bd607c71802069808d89873efb6fb0a97ca33b8430c21f')
sha512sums_armv6h=('14c0bcdb3d7634db8ceb4bf8f93cdfe705fb87736666abb541af23f20eda840b9c16ae7b1bb6aca7bc6cfb0676bf052ae3c5a7a9278d659938fb777e5abe85b2')
sha512sums_armv7h=('5f582335d69dfc40eb590b1c02b675ea920ec46b4ef887f45d626edb39560d9746da5b8ffcf8f52079d0cf8d84ced86dea3b9a79962968a54d99490149358c74')
sha512sums_aarch64=('07d3329220e16be2355bb5dfd08480d0c578ef661becaa27968841423220927716cbdd8c63e279a4b00637eb1ed6a6b6e4057d0583040e8bf3a229e20eb52123')
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
    install -Dm755 "${srcdir}/clash-linux-${_arch}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "${srcdir}/clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "${srcdir}/clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}