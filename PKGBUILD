# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.18.5
pkgrel=1
pkgdesc="A command-line tool that lets you easily create isolated shells for development."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.jetify.com/devbox/"
_ghurl="https://github.com/jetify-com/devbox"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'docker'
    'nix'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7l.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('fd443ff292354f1fc03569908de69e9438996962558debce9eed2593d7947ff4')
sha256sums_armv7h=('118800830f3ae614156fe202e954d8737d6bef80d37a6e93b7e1e8d2739f7b69')
sha256sums_i686=('ab3e69920508d5dc00766a4feccdf3edced6ca6062f354f090dd71904c86338f')
sha256sums_x86_64=('5b452a778b620fcbff460fe9cbd86ad87f5eb50b8b58923a429a5cf189fbf00d')
prepare() {
    "${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
    if [ -x /usr/bin/fish ];then
        "${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
    fi
    if [ -x /usr/bin/zsh ];then
        "${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/${pkgname%-bin}.zsh"
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    if [ -f "${srcdir}/${pkgname%-bin}.fish" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
    fi
    if [ -f "${srcdir}/${pkgname%-bin}.zsh" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    fi
}
