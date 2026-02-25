# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=rtk-bin
pkgver=0.22.2
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=('gcc-libs')
provides=('rtk')
conflicts=('rtk')
source_x86_64=("${url}/releases/download/v${pkgver}/rtk-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rtk-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e6122ede16d4bcad2954db0f6a923a29ba6f75caeabdaaa6c8fa9e1d7c826da8')
sha256sums_aarch64=('b0fbe630004a67f99b10d0a5fea977dc7cc3067cb4dfb53ea35362a58aeb51d0')

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
