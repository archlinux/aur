# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=b4-bin
pkgver=1.92.0
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

sha256sums_x86_64=('61cc7c7e8892e4704d63bd6935eedb304580a258b27f83be81e952ea8d81b230')
sha256sums_i686=('dbb78c6efa92f792dba49d542375072c95753384cfdd60550543633ac8fec0b0')
sha256sums_aarch64=('feb965b4ebbab55977fc572bd8fe2dae688053283e207313d92eb4924f05da5d')
sha256sums_riscv64=('c85186eedf0881f88a4fd85a7c2de09fb8c3a649ff370ef044540c21a68523bc')
sha256sums_loong64=('0e17c755b5d60d18cbf3d6bcf744c192057cf9198de07762a51a6a5ab98d94f6')
sha256sums_ppc64=('27611118e5155dbabbedf858e214cde7f950059f639aa74d3b96722e8d42a26b')
sha256sums_ppc64le=('bdef74e22cce60b51c3691fcf439944b841d279876f61d2dfc9e3982e98a15ed')
sha256sums_s390x=('7e9fed7108a42d926d4884711e8c7a92e756b7945ebdacbf6f47ab34b71915f5')

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
