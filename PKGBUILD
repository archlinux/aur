# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.18.1
pkgrel=1
pkgdesc="SQL Swiss Army Knife - Engine for Diverse Data Sources"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlcli="https://github.com/${_pkgauthor}/${_pkgname}.CLI/releases/download/${pkgver}"
license=('MIT')
provides=("${pkgname}")
makedepends=('libarchive' 'tar' 'rsync')
source=("musoq.service" "README.md")
source_x86_64=("${_pkgname}_${pkgver}_${arch[0]}.zip::${_urlcli}/${_pkgname}-linux-x64.zip")
source_aarch64=("${_pkgname}_${pkgver}_${arch[1]}.zip::${_urlcli}/${_pkgname}-linux-arm64.zip")
sha256sums=('93cc95a3787ded1ff91625612a9d1af9f449e6eaddb804dee030ba21be3450ce'
            '68b14337d5eaf74cfa7b2d4cac61655971ec7a81ab38f1627e98d49fb43cea42')
sha256sums_x86_64=('d235fb2253847085e47a48baeb483cc964b2d447e2662538392c74ceb561c84b')
sha256sums_aarch64=('19224914fdccad00f5f148c1ccec9543616b6cb4fdbb3e38a303575ed66e3daf')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    rsync -a --no-links "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm755 "${srcdir}/musoq.service" -t "${pkgdir}/etc/systemd/user/"

    install -Dm644 "${pkgdir}/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
