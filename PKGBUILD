# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sakura-frp
pkgver=0.45.0_sakura_4
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
md5sums=('5c9a22212419e1365e21a1ed450e132a'
         '217dc59018558a2ae6fcb98da968b022'
         '2a0bc53302d2ab06b2bcee826d10c727'
         '136ace6ea106819f10ee785b56825e4e'
         '69b510ef3fda703cd749473ffd506bfc')
md5sums_x86_64=('796633bb65f5f89c5a525dcd26f5789d')
md5sums_i686=('1112b729442710b75c05586ac0b1fdf5')
md5sums_aarch64=('9016d557910ce9c474119f11553db594')
md5sums_armv6h=('2d7d146ad7510695e2cd095a9982c5bc')
md5sums_armv7h=('c0f293fce287eddbafb34f71e9bf52d8')

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
