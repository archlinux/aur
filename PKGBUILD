# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Claude Sonnet 4.6.

pkgname=b4-bin
pkgver=1.80.2
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

sha256sums_x86_64=('e65af09ab64483ed04912f8d27fffc86b9a802d342de1adabff9dbb36d22fa71')
sha256sums_i686=('07177b40c7e3bb2cb79fd7ede54ed1ca1c9dd168724dbfb9e3157b4a4d174b39')
sha256sums_aarch64=('4c1417c4ce84da0d7bc3047a6b5b950a0264e4f223bb58a9ca0f09ac3e7a8c67')
sha256sums_riscv64=('89d35b9a429d627ce48b1d7e83c5aedbfb9fdccfe30caded2820352a07036aa1')
sha256sums_loong64=('78fc77bf55ab386f1bb2754133109de77fb27128fba1877d8a8dab481ae0d6e9')
sha256sums_ppc64=('234b7fa806e27c713cf20d8ca093a0622fffe643059d26922964ecd15a8f6125')
sha256sums_ppc64le=('e834a810de5c2a09efd2194959149bf310b69076fe6e2bd5bf4adf1225e8b926')
sha256sums_s390x=('fbb3ca43014d43c2f6ae4bb90d8460bfe1c9b2cdcd6d24b00073eec6a43fde85')

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
