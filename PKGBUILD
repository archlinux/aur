# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.34.1
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
sha256sums_x86_64=('78bd7aed073c9d79c4f62fb111cbf8358e33c0c30e7eea301fbb8b5fd8656ff7')
sha256sums_aarch64=('e43c5d490661be94063078f5e938700450afe6f8925be0bad466fc2d933df5d0')

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
