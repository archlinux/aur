# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
pkgname=ouch-bin
pkgver=0.4.2
pkgrel=3
pkgdesc="Painless compression and decompression in the terminal (binary release)"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('6308ae6fb288a445bcbc674b8691ad1adc00389a9e383513ff286487efccd85b')
sha256sums_armv7h=('c925dd3f64f96c882055a57d9c24e6b906e7ab81cb8ac7073a06c31571ef023f')
sha256sums_x86_64=('81c71d3cdf61a2ca21e0e973c532e91ffd142a806af60455e08883d1a0decd24')
build() {
    mv "${srcdir}/${pkgname%-bin}-${CARCH}"* "${srcdir}/${pkgname%-bin}"
}
package() {
    install -Dm0755 "${srcdir}/${pkgname%-bin}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm0644 "${srcdir}/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname%-bin}/man/${pkgname%-bin}"* -t "${pkgdir}/usr/share/man/man1"
    install -Dm0644 "${srcdir}/${pkgname%-bin}/completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm0644 "${srcdir}/${pkgname%-bin}/completions/${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-bin}.fish"
    install -Dm0644 "${srcdir}/${pkgname%-bin}/completions/_${pkgname%-bin}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
}