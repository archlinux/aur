# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud
pkgname=opencloud-bin
pkgver=7.2.2
pkgrel=1
pkgdesc="Open source platform for file management, sharing & collaboration - upstream built binary"
url="https://opencloud.eu"
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
optdepends=("opencloud-web: if wanting to use a customized web interface")
install="opencloud.install"
conflicts=(opencloud)
provides=(opencloud)
backup=('etc/opencloud/opencloud.env')
source=(
  opencloud.env
  opencloud.service
  opencloud.sysusers
  opencloud.tmpfiles
)
source_x86_64=(${_pkgname}-${pkgver}-x86_64::https://github.com/opencloud-eu/opencloud/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64)
source_aarch64=(${_pkgname}-${pkgver}-aarch64::https://github.com/opencloud-eu/opencloud/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64)
sha512sums=('5e133e8d5037fd33c9a1ff915273a985fab7703b8f71979aef92bae4beac4e884d97ce27ee074576abf049a082712bcd3e2d6da2a45e20220fa385babc6826ac'
            '62e701e9630aae725ef978198cce706ffdaa6be02ce509ef5b0051cc6b01a9e8374431a9b6fc5189432d3ecfe25edcbb4cc934d8908b1c1ae773e2f6aa55b62d'
            'bd4c449165e0b314cde60437b30214286a0605ccf8ae233fa587d904c16f9225cb822d8636d182b11f91224aa42969f28fc99400b692c2265c47b51b49e2d188'
            'db82871e0f1e57cf852d4ad10116505c62b46d5dab5c87a15628847cdde16331e09cc7968ed7e1ad0bed266ba30e22b48a9673e2a334e6c7b1be709fe6fd986a')
sha512sums_aarch64=('ec694c4a1cf571c8a82e82ddc9d6cbf8b2c665ec6b2d751dcf30dbadd076d625a25f5e687c608ba3021a6e80fbb34b6adf64b1f12053e02cf077e17aba7c78d2')
sha512sums_x86_64=('e33e73a05628ea59c043a6605073d4bc4b8039e8097cce692789f0af53e876a60f4280241eae942987bc6b5f4d9a6e0f3828e76bb7bcf4063554e6eed5bca4d5')


package() {
  install -vDm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"

  # systemd integration
  install -vDm640 -t "${pkgdir}/etc/${_pkgname}" "${_pkgname}.env"
  install -vDm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
