# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
pkgname=ouch-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="Painless compression and decompression in the terminal (binary release)"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('xz' 'gcc-libs' 'zlib' 'glibc')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('b1a6d445a4f7112ec06a68ff5f6883dae6d919dfd3f60b3a2741197158ae0664')
sha256sums_armv7h=('979b1d5d4ea1146f95d585359138b1d4c0131fb6e914a3dcfae7018d0f9bfacb')
sha256sums_x86_64=('b27902df86aa2b4df28e1d53214af1d5391beabd4c1cbee850d80c2168329d62')
package() {
    mv "${srcdir}/${pkgname%-bin}-${CARCH}"* "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}"
    install -Dm0755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm0644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/man/${pkgname%-bin}"* -t "${pkgdir}/usr/share/man/man1"
    install -Dm0644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm0644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/completions/${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-bin}.fish"
    install -Dm0644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}/completions/_${pkgname%-bin}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm0755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}" 
}