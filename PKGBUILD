# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=0.3.1
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
sha256sums_aarch64=('854f260f304b80d61219b5d2e4ff91909f9916d8b504e704e8c78131d0fcc432')
sha256sums_armv7h=('f7d6d246b755d97ffd235f9c1741c1e9687fac1a45b5be757495c915bbfd5a63')
sha256sums_i686=('97226bd83359851a5381d25f7cb9099ae4c5a15a4c317316602b9500e6d4a03d')
sha256sums_x86_64=('48d99191197bd286b8de01fde8a18e31a60b3e5f79a05a04f7d7610918798999')
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