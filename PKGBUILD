# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.5 Plus (Alibaba).

pkgname=b4-bin
pkgver=1.47.2
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

sha256sums_x86_64=('87858de77ce35a069c7597f31e9570a6ed569babe943815a620eac7c65c1f282')
sha256sums_i686=('935be39a06c0fb4967f66cf4f9ff7383b763ae7e2e6f5f9a22d2b3e8849d8cbf')
sha256sums_aarch64=('e60ad1b2af2ab63f398fee96b19c7ad2f329d36dfcd7dcd99b6aaf37d5d7a0d1')
sha256sums_riscv64=('566de6fa804e15defc3b79f691b1f868f8be39324d780b97d8f34a40896804d5')
sha256sums_loong64=('d458a415ec2e5e16fe5f1a259c3de759c891f4d6e067e0653e3a5e1ac641968b')
sha256sums_ppc64=('06e308beefa373c2f6797a8418e7d7c3b3a455e2b794a37fe15f48ce6caa79db')
sha256sums_ppc64le=('89bdf38fa3f9867afd446a776cf039c6fc94ed82f7147bb4acef869a328291c4')
sha256sums_s390x=('7ed364397d9dd03a1367e06aa9147bf3f8e77253d87b1829a33df307c88b5b19')

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
