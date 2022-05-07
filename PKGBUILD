# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.42.0_sakura_1.1
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
source_armv7h=(${pkgname}-${pkgver}-armv7h::"${_url}/${pkgver//_/-}/frpc_linux_armv7")
source_armv6h=(${pkgname}-${pkgver}-armv6h::"${_url}/${pkgver//_/-}/frpc_linux_arm_garbage")
# disbale strip
# => strip: error: the input file './usr/bin/sakura-frpc' has no sections
options=('!strip')
md5sums=('b9fb6d2fc1b0f5733e98e9fa15d7a2c1'
         '217dc59018558a2ae6fcb98da968b022'
         '2a0bc53302d2ab06b2bcee826d10c727'
         '136ace6ea106819f10ee785b56825e4e'
         '69b510ef3fda703cd749473ffd506bfc')
md5sums_x86_64=('2e5e0cb8e56b5f5b4e9c3de82accac28')
md5sums_i686=('291d48f80fd37a837194da250051cac6')
md5sums_aarch64=('e403bb450a949ee8679ac598f0e7adf8')
md5sums_armv6h=('69d9b9c0fc3e57bde70554416810a235')
md5sums_armv7h=('ca8f63dc81293585e615b63435499e3a')

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
