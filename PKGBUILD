# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=apm-bin
pkgdesc="Agent Package Manager by Microsoft"
pkgver=0.14.0 # renovate: datasource=github-tags depName=microsoft/apm
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
sha256sums_x86_64=('5ca7853e4b8858272da721e1d68548a6c078f7920487298bef901bd6e709a7d1')
sha256sums_aarch64=('3a8340b02851a94760a449d732e5f417b2ba4409689471302af9c5801851ad72')

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
