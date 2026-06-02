# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud
pkgname=opencloud-bin
pkgver=7.0.0
pkgrel=2
pkgdesc="Open source platform for file management, sharing & collaboration"
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
sha512sums_aarch64=('9bca0745aebdb2a949d9e9d322b953a16882a57b7393f60af7bd27333b699fed1f49a3b6fece99a730a57fab9565137d57389c562c73c7614595c0b2e278fe29')
sha512sums_x86_64=('a402a57dee2ff830c3ef1e4bf87fd034f764bfec7bfa7bc7cb22e5efe615f1fb236002361a26a4514bacb292e660ea3035a945a4360a3d656b46368fe8255da2')


package() {
  install -vDm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"

  # systemd integration
  install -vDm640 -t "${pkgdir}/etc/${_pkgname}" "${_pkgname}.env"
  install -vDm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
