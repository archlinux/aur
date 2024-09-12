# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_name=Musoq
pkgver=0.12.0
pkgrel=2
pkgdesc="SQL Swiss Army Knife - Engine for Diverse Data Sources"
arch=('x86_64' 'aarch64')
url="https://puchaczov.github.io/Musoq/"
_urlcli="https://github.com/Puchaczov/Musoq.CLI/releases/download/${pkgver}"
license=('MIT')
provides=("pkgname")
makedepends=('libarchive' 'tar' 'rsync')
source=("musoq.service" "README.md")
source_x86_64=("${_name}_${pkgver}_x86_64.zip::${_urlcli}/Musoq-linux-x64.zip")
source_aarch64=("${_name}_${pkgver}_aarch64.zip::${_urlcli}/Musoq-linux-arm64.zip")
sha256sums=('93cc95a3787ded1ff91625612a9d1af9f449e6eaddb804dee030ba21be3450ce'
            'cf7881d1f2c8e1eb249a7bc2aff180fc6e5e7091ad95ceaa8e359cbdd3f6fbef')
sha256sums_x86_64=('cb28a172e3b68da6831921604ceb116f9fd8cc766f20bc3adcf283d7c449be53')
sha256sums_aarch64=('ff9f4a9c1b540e06bd92790d50b33d4e8a49c062345ffe410912b4fb1801f2cc')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    rsync -a --no-links "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "${pkgdir}/opt/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm755 "${srcdir}/musoq.service" -t "${pkgdir}/etc/systemd/user/"

    install -Dm644 "${pkgdir}/opt/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
