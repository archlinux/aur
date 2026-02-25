# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=notation-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='CLI tool to sign and verify OCI artifacts (CNCF Notary Project)'
arch=('x86_64' 'aarch64')
url='https://github.com/notaryproject/notation'
license=('Apache-2.0')
provides=('notation')
conflicts=('notation')
source_x86_64=("${url}/releases/download/v${pkgver}/notation_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/notation_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e1a0f060308086bf8020b2d31defb7c5348f133ca0dba6a1a7820ef3cbb6dfe5')
sha256sums_aarch64=('34143c7b816a50104824278080a5cf12bbf855488e003f62e6acf27ed25c423c')

package() {
    install -Dm755 notation -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # completions
    for shell in bash zsh fish; do
        ./notation completion "$shell" > "notation.$shell"
    done
    install -Dm644 notation.bash "${pkgdir}/usr/share/bash-completion/completions/notation"
    install -Dm644 notation.zsh "${pkgdir}/usr/share/zsh/site-functions/_notation"
    install -Dm644 notation.fish "${pkgdir}/usr/share/fish/vendor_completions.d/notation.fish"
}
