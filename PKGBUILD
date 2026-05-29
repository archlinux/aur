# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sakura-frp
pkgver=0.51.0_sakura_12.3
pkgrel=1
pkgdesc="Sakura Frp Client"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://www.natfrp.com/"
license=('custom')
provides=('sakura-frpc' 'natfrp')
source=(LICENSE::'https://www.natfrp.com/policy/tos'
        "frpc.ini"
        "${pkgname}.tmpfiles"
        "${pkgname}.sysusers"
        "${pkgname}c.service"
        "${pkgname}c@.service"
        "${pkgname}c-f@.service")
backup=("etc/${pkgname}/frpc.ini")
_url="https://nya.globalslb.net/natfrp/client/frpc/"
source_x86_64=(${pkgname}-${pkgver}-x86_64::"${_url}/${pkgver//_/-}/frpc_linux_amd64")
source_i686=(${pkgname}-${pkgver}-i686::"${_url}/${pkgver//_/-}/frpc_linux_386")
source_aarch64=(${pkgname}-${pkgver}-aarch64::"${_url}/${pkgver//_/-}/frpc_linux_arm64")
source_armv7h=(${pkgname}-${pkgver}-armv7::"${_url}/${pkgver//_/-}/frpc_linux_armv7")
# disbale strip
# => strip: error: the input file './usr/bin/sakura-frpc' has no sections
options=('!strip')
md5sums=('f1d2d43f987429858b1bb88a3209833c'
         '217dc59018558a2ae6fcb98da968b022'
         'dde0a7ec9482aa7fd1cbccd9ee573794'
         '7bb599e157bc23c927c9d316fc29b0c8'
         'aa5e634fe5032eff425151306be9d3d8'
         'c376a78ccc30f4c741eb4df195c8be69'
         'b6f05593949f04968ea4012be9aad10c')
md5sums_x86_64=('8ba7dcde07b1181e4f011e011321c6f8')
md5sums_i686=('00f0b4bfc7e7b339c0c9884d4f45be16')
md5sums_aarch64=('248fb095f2c1a9ed8e9a05784223c40b')
md5sums_armv7h=('59881860fc75bc5e426a816fce6b628e')

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

  # tmpfiles & sysusers
  install -Dm644 ${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm644 ${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
}

# vim: set sw=2 ts=2 et:
