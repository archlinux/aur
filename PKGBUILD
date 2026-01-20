# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.24.5
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
sha256sums=('aea3a93ba75d67512eddedbd76db41b0d3c8c49687ecae199d21fa775946660b'
            'b3af2729a26bb0cfbdbeef32755e76b5b7f7d65a02d4b9b8fe708f4f096f3ccc')
sha256sums_x86_64=('08f4fdb3d3ca76a2ed0d3151e29f6138f4531da6b4a37b368641a5f4f666ee19')
sha256sums_aarch64=('9762f2c300717eaca63ae837175478cad0860a21caac41f7cbad06e58687808f')


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
