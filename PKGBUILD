# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.26.0
pkgrel=1
pkgdesc="SQL Swiss Army Knife - Engine for Diverse Data Sources"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlcli="https://github.com/${_pkgauthor}/${_pkgname}.CLI/releases/download/${pkgver}"
license=('MIT')
provides=("${pkgname}")
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('unzip')
options=('!strip')
noextract=("${_pkgname}_${pkgver}_${CARCH}.zip")
source=("README.md"
        "musoq.service")
source_x86_64=("${_pkgname}_${pkgver}_${arch[0]}.zip::${_urlcli}/${_pkgname}-linux-x64.zip")
source_aarch64=("${_pkgname}_${pkgver}_${arch[1]}.zip::${_urlcli}/${_pkgname}-linux-arm64.zip")
sha256sums=('ffb33a248576e3800b40952a2224833b0fcc5a714b967a5827c133815f53db34'
            'b3af2729a26bb0cfbdbeef32755e76b5b7f7d65a02d4b9b8fe708f4f096f3ccc')
sha256sums_x86_64=('918e4e67b647ebdfdb4f8141a66c4234a804af07e9feb6aca6cad9aa139cd2d9')
sha256sums_aarch64=('ea74bb32af02ee737bdbe1ae4ae833a27aa27a7e40df0caf0061df28c917b787')


package() {
    cd "${pkgdir}/" || exit

    install -dm777 "${pkgdir}/opt/${_pkgname}/"
    unzip -q "${srcdir}/${_pkgname}_${pkgver}_${CARCH}.zip" -d "${pkgdir}/opt/${_pkgname}/"
    chmod -R 777 "${pkgdir}/opt/${_pkgname}/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -rsf "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/musoq.service" -t "${pkgdir}/usr/lib/systemd/user/"

    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${pkgdir}/opt/${_pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
