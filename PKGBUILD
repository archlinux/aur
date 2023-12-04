# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
pkgname=ouch-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal (binary release)"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'xz'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('61aa7356180a41efc90f47418181c446c2614c768c12b7fe14663c54dd122903')
sha256sums_armv7h=('538d60fa673c39ee5291f1a66544316076d0ce124bf122266e06897eeffc7f2e')
sha256sums_x86_64=('504242533518e07d0301c7fdbc8b69aa6e5ddb0261f1f3f0213d8a944cfe554f')
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