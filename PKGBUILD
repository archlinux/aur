# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=b4-bin
pkgver=1.80.4
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

sha256sums_x86_64=('d72b1c64ee1c22b60279879927b2a449b1d38f8a7e3b91912d18f67693a202a9')
sha256sums_i686=('07de510639437a928162e4ea03f1fe53f33e7f5749a1439d187c86e7591fa82f')
sha256sums_aarch64=('1ffc25d2550473b9568cdd101058bacff4812b6cade98e528fcd53521574f3a6')
sha256sums_riscv64=('d6d3631941a5516211ab647dd6f27e56779f0643d421a8d6cd10455e182d8a93')
sha256sums_loong64=('4ba54f9b121ad0ea627ef447de2e0555e7a22e8fd4807ec1a25cc7f11c00c059')
sha256sums_ppc64=('6e2e64b3c6e3b987b7c06d14d239e9e76258ed19281a39c6f40ee451b1a43ceb')
sha256sums_ppc64le=('8a8411a3b65470c0acc66e7c88c45cbd271dfc8bdd6e624d27300b4ce671c53b')
sha256sums_s390x=('8fa865b788d0d9c148842d82cdd9e4e0dd53258bf9476e285399cba47c1302ff')

backup=('etc/b4/b4.json')

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
    install -dm755 "${pkgdir}/etc/b4"
}
