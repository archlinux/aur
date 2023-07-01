# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sakura-frp
pkgver=0.45.0_sakura_5.2
pkgrel=1
pkgdesc="Sakura Frp"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://www.natfrp.com/"
license=('custom')
provides=('sakura-frpc' 'natfrp')
source=(LICENSE::'https://www.natfrp.com/policy/tos'
        "frpc.ini"
        "${pkgname}c.service"
        "${pkgname}c@.service"
        "${pkgname}c-f@.service")
backup=("etc/${pkgname}/frpc.ini")
_url="https://nyat-static.globalslb.net/natfrp/client"
source_x86_64=(${pkgname}-${pkgver}-x86_64::"${_url}/${pkgver//_/-}/frpc_linux_amd64")
source_i686=(${pkgname}-${pkgver}-i686::"${_url}/${pkgver//_/-}/frpc_linux_386")
source_aarch64=(${pkgname}-${pkgver}-aarch64::"${_url}/${pkgver//_/-}/frpc_linux_arm64")
source_armv7h=(${pkgname}-${pkgver}-armv7::"${_url}/${pkgver//_/-}/frpc_linux_armv7")
source_armv6h=(${pkgname}-${pkgver}-armv6h::"${_url}/${pkgver//_/-}/frpc_linux_arm_garbage")
# disbale strip
# => strip: error: the input file './usr/bin/sakura-frpc' has no sections
options=('!strip')
md5sums=('SKIP'
         '217dc59018558a2ae6fcb98da968b022'
         '2a0bc53302d2ab06b2bcee826d10c727'
         '136ace6ea106819f10ee785b56825e4e'
         '69b510ef3fda703cd749473ffd506bfc')
md5sums_x86_64=('aea1bf56a80c9e72b6e53a9fa61a78c0')
md5sums_i686=('58ba89ea6bb85019efcaea6d4bce0d82')
md5sums_aarch64=('85569890a0b66462a4eb9c2c435a02f7')
md5sums_armv6h=('0b86a8018a69a545ae8b38f3b0412839')
md5sums_armv7h=('c3187822c4579f8b04ff38be3a60a4a8')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} ${pkgdir}/usr/bin/${pkgname}c

  # frpc.ini
  install -Dm644 ${srcdir}/frpc.ini -t ${pkgdir}/etc/${pkgname}/

  # systemd service
  install -Dm644 ${pkgname}c.service -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${pkgname}c@.service -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${pkgname}c-f@.service -t ${pkgdir}/usr/lib/systemd/system/

  # LICENSE
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
