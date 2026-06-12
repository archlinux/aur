# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.42.4
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=('gcc-libs')
provides=('rtk')
conflicts=('rtk')
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/rtk-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('34975116da11e09e502501daf758143e0b22ed3a42a10eb67fb693a6270d9e36')
sha256sums_aarch64=('cc2b91c064eb670c097c184913c8fbcb1a943d53d7fe505375e96ba0c5b6459f')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"

    cd "${srcdir}"
    _srcdir="rtk-${pkgver}"
    _license_url="${url}/raw/v${pkgver}/LICENSE"
    _readme_url="${url}/raw/v${pkgver}/README.md"
    curl -sL "$_license_url" -o LICENSE
    curl -sL "$_readme_url" -o README.md
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
