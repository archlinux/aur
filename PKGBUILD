# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.15.3
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
            'cf7881d1f2c8e1eb249a7bc2aff180fc6e5e7091ad95ceaa8e359cbdd3f6fbef')
sha256sums_x86_64=('eb4cba3acb5e44317e2f90233a2c09048112b7c7f812abb85a609d1a26b615d2')
sha256sums_aarch64=('2d6e2d983c24ff549a7c092a4738b7fa9f7297140abe007b3e12330024213b52')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    rsync -a --no-links "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm755 "${srcdir}/musoq.service" -t "${pkgdir}/etc/systemd/user/"

    install -Dm644 "${pkgdir}/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
