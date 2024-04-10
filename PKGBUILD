# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A cross-platform and extendable version manager with support for Java, Node.js, Flutter, .Net & more"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://vfox.lhan.me/"
_ghurl="https://github.com/version-fox/vfox"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
)
optdepends=(
    'zsh'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.deb")
sha256sums_aarch64=('3a1e3a62486b6e0060b9b2e2e219a7f79df411fc585ade58803c9482571ecc1d')
sha256sums_armv7h=('977a49d479457aa8fe1043bbd1f73ca0d1b8aad508bcd7b50219b7a95a9edbb8')
sha256sums_i686=('d9749b8447ba234e953c6e504370a4f881ea958cb604495983b275e5cf65e51d')
sha256sums_x86_64=('193f3aa3974bd74188d87752a1cf3d4c8b06dc67b4f82e9e95e922c4f10bde6e')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completions/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    if [ -d "/usr/share/zsh" ];then 
        install -Dm644 "${srcdir}/usr/share/zsh/vendor-completions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    fi
}