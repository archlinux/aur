# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.

pkgname=b4-bin
pkgver=1.91.0
pkgrel=1
pkgdesc="Network packet processor with a friendly UI for circumventing Deep Packet Inspection (DPI) systems"
arch=('x86_64' 'i686' 'aarch64' 'riscv64' 'loong64' 'ppc64' 'ppc64le' 's390x')
url="https://github.com/DanielLavrushin/b4"
license=('GPL-3.0-only')
depends=('iptables')
optdepends=('nftables: alternative firewall engine')
provides=('b4')
conflicts=('b4')
options=('!debug' '!strip')

_baseurl="https://github.com/DanielLavrushin/b4/releases/download/v${pkgver}"

source=("b4.service")
sha256sums=('a4a7663bc633b35cd9a885380a1c826c8ec11c311d521f3c04494f58ac7671f7')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_baseurl}/b4-linux-amd64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${_baseurl}/b4-linux-386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_baseurl}/b4-linux-arm64.tar.gz")
source_riscv64=("${pkgname}-${pkgver}-riscv64.tar.gz::${_baseurl}/b4-linux-riscv64.tar.gz")
source_loong64=("${pkgname}-${pkgver}-loong64.tar.gz::${_baseurl}/b4-linux-loong64.tar.gz")
source_ppc64=("${pkgname}-${pkgver}-ppc64.tar.gz::${_baseurl}/b4-linux-ppc64.tar.gz")
source_ppc64le=("${pkgname}-${pkgver}-ppc64le.tar.gz::${_baseurl}/b4-linux-ppc64le.tar.gz")
source_s390x=("${pkgname}-${pkgver}-s390x.tar.gz::${_baseurl}/b4-linux-s390x.tar.gz")

sha256sums_x86_64=('7f12c2f4dd2782997088512efa4877a6e1aa17f8b89000d761b738006e7bd1e2')
sha256sums_i686=('7ddf82415f31fcfe73018eeb879bc9dde1c243deba8633fe828bc6b09aa42282')
sha256sums_aarch64=('288f3448ec1afb9bdbe43fc787f84152217b99e6069f640ba348a294c8b0e2ca')
sha256sums_riscv64=('0acc1bf40b39c94d075a6653f64de2bcbb8a5ae00455c39a66a0ea1777e2de43')
sha256sums_loong64=('26ecb49060773edc58625b281c9d041c364d5d3619b6aedad092a6ae29227d3f')
sha256sums_ppc64=('07b75282a078f303e00f20fb0f0c2c87e441387a8b7bfeb365e5e4fafbaa914b')
sha256sums_ppc64le=('51686177abde0d5dc7aa7d02de1c5247c649c1e9cb299e19f00a97967abf23de')
sha256sums_s390x=('943800ad57b274bdda1cd718e90af30ca6dd1892f96f20d87cfb72c99f3b21c5')

package() {
    case "$CARCH" in
        x86_64)  _tarball="${pkgname}-${pkgver}-x86_64.tar.gz" ;;
        i686)    _tarball="${pkgname}-${pkgver}-i686.tar.gz" ;;
        aarch64) _tarball="${pkgname}-${pkgver}-aarch64.tar.gz" ;;
        riscv64) _tarball="${pkgname}-${pkgver}-riscv64.tar.gz" ;;
        loong64) _tarball="${pkgname}-${pkgver}-loong64.tar.gz" ;;
        ppc64)   _tarball="${pkgname}-${pkgver}-ppc64.tar.gz" ;;
        ppc64le) _tarball="${pkgname}-${pkgver}-ppc64le.tar.gz" ;;
        s390x)   _tarball="${pkgname}-${pkgver}-s390x.tar.gz" ;;
    esac

    # архив содержит один бинарник — находим его
    local _bin
    _bin=$(tar -tzf "${srcdir}/${_tarball}" | grep -v '/$' | head -n1)

    tar -xzf "${srcdir}/${_tarball}" -C "${srcdir}"
    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/b4"
    install -Dm644 "${srcdir}/b4.service" "${pkgdir}/usr/lib/systemd/system/b4.service"
}
