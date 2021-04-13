# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.36.1_sakura_1
pkgrel=1
pkgdesc="Sakura Frp"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://www.natfrp.com/"
license=('custom')
provides=('sakura-frpc' 'natfrp')
source=(LICENSE::'https://www.natfrp.com/policy/'
        "frpc.ini"
        "${pkgname}c.service"
        "${pkgname}c@.service"
        "${pkgname}c-f@.service")
backup=("etc/${pkgname}/frpc.ini")
source_x86_64=(${pkgname}-${pkgver}-x86_64::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_amd64")
source_i686=(${pkgname}-${pkgver}-i686::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_386")
source_armv7h=(${pkgname}-${pkgver}-armv7h::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_armv7")
source_armv6h=(${pkgname}-${pkgver}-armv6h::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_armv6")
source_aarch64=(${pkgname}-${pkgver}-aarch64::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_arm64")
# disbale strip
# => strip: error: the input file './usr/bin/sakura-frpc' has no sections
options=('!strip')
md5sums=('SKIP'
         '217dc59018558a2ae6fcb98da968b022'
         '2a0bc53302d2ab06b2bcee826d10c727'
         '136ace6ea106819f10ee785b56825e4e'
         '69b510ef3fda703cd749473ffd506bfc')
md5sums_x86_64=('ec03ac70fa11438151191b367f0ee7e1')
md5sums_i686=('9020882124b07c7ab99222de7a4af772')
md5sums_aarch64=('39f07e2d5ae0f3655673dccca9484a19')
md5sums_armv6h=('8f34582942b9ce2d14c6de5d0963181e')
md5sums_armv7h=('bfa01fe13a4cedf6321592930d37f313')

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
