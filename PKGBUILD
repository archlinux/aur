# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=apm-bin
pkgdesc="Agent Package Manager by Microsoft"
pkgver=0.26.0 # renovate: datasource=github-tags depName=microsoft/apm
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
sha256sums_x86_64=('3afba455c5283852ba4c392f668be7c27b65bc4a0fa60a8b53a4626c52628431')
sha256sums_aarch64=('c4d6b5ab6d9bdca3c3c324db7ce8d1c4faf7b317f45a55a50ae2571eaa506d25')

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
