# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.16.1
pkgrel=1
pkgdesc="SQL Swiss Army Knife - Engine for Diverse Data Sources"
arch=('x86_64' 'aarch64')
url="https://${_pkgauthor}.github.io/${_pkgname}/"
_urlcli="https://github.com/${_pkgauthor}/${_pkgname}.CLI/releases/download/${pkgver}"
license=('MIT')
provides=("${pkgname}")
makedepends=('libarchive' 'tar' 'rsync')
source=("musoq.service" "README.md")
source_x86_64=("${_pkgname}_${pkgver}_${arch[0]}.zip::${_urlcli}/${_pkgname}-linux-x64.zip")
source_aarch64=("${_pkgname}_${pkgver}_${arch[1]}.zip::${_urlcli}/${_pkgname}-linux-arm64.zip")
sha256sums=('93cc95a3787ded1ff91625612a9d1af9f449e6eaddb804dee030ba21be3450ce'
            'dd1656274ba0c9c7ffbfa4783472c356a744b619e1f15a99245ec31665e89863')
sha256sums_x86_64=('66c8929d3560bdd0f0ef6832341522855d34396902f41e865bda8a627eebd804')
sha256sums_aarch64=('9b8347a7cfd4b592097d10a022cf37a9295bf79f26344a165bb904a38039a8c0')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    rsync -a --no-links "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm755 "${srcdir}/musoq.service" -t "${pkgdir}/etc/systemd/user/"

    install -Dm644 "${pkgdir}/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
