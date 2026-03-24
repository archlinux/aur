# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=apm-bin
pkgdesc="Agent Package Manager by Microsoft"
pkgver=0.8.5 # renovate: datasource=github-tags depName=microsoft/apm
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/apm"
license=('MIT')
provides=('apm')
conflicts=('apm')
_url_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_url_base}/apm-linux-x86_64.tar.gz")
source_aarch64=("${_url_base}/apm-linux-arm64.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/microsoft/apm/v${pkgver}/LICENSE")
sha256sums=('7df20dcdf9197e9945c14858d41c60f11b52b93e5b69e2b63416b874d598d322')
sha256sums_x86_64=('222da44e043fa3c81557367caeeb8c45595781456e225da9c1d8a6f978a7b9d1')
sha256sums_aarch64=('dd737344267cebcb4bafdbd22e103412aac4c49611ad8cadf216da31eac5da2f')

package() {
    install -d "${pkgdir}/usr/lib/apm"
    install -d "${pkgdir}/usr/bin"

    if [[ "${CARCH}" == "aarch64" ]]; then
        cp -r "${srcdir}/apm-linux-arm64/"* "${pkgdir}/usr/lib/apm/"
    else
        cp -r "${srcdir}/apm-linux-x86_64/"* "${pkgdir}/usr/lib/apm/"
    fi

    ln -sf "/usr/lib/apm/apm" "${pkgdir}/usr/bin/apm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
