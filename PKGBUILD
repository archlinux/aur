# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.27.2
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=('gcc-libs')
provides=('rtk')
conflicts=('rtk')
source_x86_64=("${url}/releases/download/v${pkgver}/rtk-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rtk-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('862fb8430c9e36c04e521410f2c459545fc1a0690ba7168d3335ee8044df9084')
sha256sums_aarch64=('6eb9ff8010e6694ef36f27d2fe264586a7ebe1e4e17d252f6af718396ad0487e')

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
