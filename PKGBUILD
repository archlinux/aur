# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=0.3.0
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
sha256sums_aarch64=('10e7e4180903123345af0048ced3332f43653d8573831f508abd9b192b22e67c')
sha256sums_armv7h=('2bcb47fc85b1de43c7f5e41e2e6f6c7f6eb4e074284261f5a60c2b084d736145')
sha256sums_i686=('a4672eb8456b588781dbcb7a9c2176a0ffccde97e4aaf6a8fb3ce66d57a67ab0')
sha256sums_x86_64=('ccf6a73df4f511d439245b8c8614598d351a22c9c9f38b667efd047f45801bf1')
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