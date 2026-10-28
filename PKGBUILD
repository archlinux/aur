# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=sing-box-cagedbird-bin
_pkgname=sing-box
_pkgver=1.15.0-alpha.13-cagedbird.20261028094851.f942d2532
pkgver=1.15.0_alpha.13_cagedbird.20261028094851.f942d2532
epoch=1
pkgrel=2
pkgdesc='The universal proxy platform with native Clash subscription support (cagedbird binary build)'
arch=('x86_64' 'aarch64')
url='https://github.com/cagedbird043/sing-box'
license=('LicenseRef-sing-box')
depends=('curl')
provides=('sing-box')
conflicts=('sing-box' 'sing-box-bin' 'sing-box-alpha' 'sing-box-beta' 'sing-box-beta-bin' 'sing-box-git')
backup=('etc/sing-box/config.json')
options=('!debug')
optdepends=('sing-geosite-rule-set: GeoSite rule sets'
            'sing-geoip-rule-set: GeoIP rule sets')

_release_tag="v${_pkgver}"
_release_url="${url}/releases/download/${_release_tag}"
_raw_url="${url}/raw/${_release_tag}"
source=("config.json-${_pkgver}::${_raw_url}/release/config/config.json"
        "sing-box.service-${_pkgver}::${_raw_url}/release/config/sing-box.service"
        "sing-box@.service-${_pkgver}::${_raw_url}/release/config/sing-box@.service"
        "sing-box-split-dns.xml-${_pkgver}::${_raw_url}/release/config/sing-box-split-dns.xml"
        "sing-box-network-recover-${_pkgver}::${_raw_url}/release/config/sing-box-network-recover"
        "sing-box-config-pull-${_pkgver}::${_raw_url}/release/config/sing-box-config-pull"
        "sing-box-config-pull.service-${_pkgver}::${_raw_url}/release/config/sing-box-config-pull.service"
        "sing-box-config-pull.timer-${_pkgver}::${_raw_url}/release/config/sing-box-config-pull.timer")
source_x86_64=("${_pkgname}-cagedbird-linux-amd64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-cagedbird-linux-arm64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-arm64.tar.gz")
sha256sums=('4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde'
            '51c05b1c9415a57f1fb3c4d67d9cb2aeee1b7fcd1671747d349988ed371a66fd'
            'c246af05df1d89da50edc8c6de8b077907974fe614ab64bd43151f79ab4e0158'
            'ba33c0c5bfdc5cd68b44c576cd97b33f0bfa0198e66ff8f34f21e706e97fda9e'
            '2a6970a742c8a9b9a582fc65921545d15c45fc342aea45a0d4fc0d1b2952e288'
            '302c60f8b73705f4b1382c0bf35698d63b7b56940c62167f70cbb86a2efe32db'
            'b0fab6d2d3107ab03a5be0fe4fa10afb42c1efea0203cb96cf6091d28492c903'
            '2419da22721c800e886c6d075fd081f107c698b2e1e89fc5111d31bad33f72fc')
sha256sums_x86_64=('a95e52713b951b2cb7339a1a21fd3f45ff8a73b547bee4218b5a619b8441a897')
sha256sums_aarch64=('5731a4bc7496ef3a156193c9fbcd41e605fb91edef60c598260c379cad35ff05')

package() {
    install -Dm644 "config.json-${_pkgver}" "${pkgdir}/etc/sing-box/config.json"
    install -Dm644 "sing-box.service-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box.service"
    install -Dm644 "sing-box@.service-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box@.service"
    install -Dm644 "sing-box-split-dns.xml-${_pkgver}" "${pkgdir}/usr/share/dbus-1/system.d/sing-box-split-dns.conf"
    install -Dm755 "sing-box-network-recover-${_pkgver}" "${pkgdir}/usr/lib/NetworkManager/dispatcher.d/90-sing-box-recover"
    install -Dm755 "sing-box-config-pull-${_pkgver}" "${pkgdir}/usr/lib/sing-box/sing-box-config-pull"
    install -Dm644 "sing-box-config-pull.service-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box-config-pull.service"
    install -Dm644 "sing-box-config-pull.timer-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box-config-pull.timer"

    declare -A arch_map=([x86_64]='amd64' [aarch64]='arm64')
    cd "${srcdir}/${_pkgname}-cagedbird-linux-${arch_map[$CARCH]}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 <("./${_pkgname}" completion bash) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 <("./${_pkgname}" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <("./${_pkgname}" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
