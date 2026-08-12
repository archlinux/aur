# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=linear-cli-schpet-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Linear without leaving the command line: list, start, and create PRs for linear issues. Agent friendly."
arch=('x86_64' 'aarch64')
url="https://github.com/schpet/linear-cli"
license=('ISC')
depends=('glibc' 'gcc-libs')
options=('!strip')
provides=('linear-cli')
conflicts=('linear-cli' 'linear-cli-schpet')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::https://github.com/schpet/linear-cli/releases/download/v${pkgver}/linear-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::https://github.com/schpet/linear-cli/releases/download/v${pkgver}/linear-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('62accf1eb36c31e897f8490e826182f012b9a4b3a2c0d3bf8c8dde906039c3ea')
sha256sums_aarch64=('c8ddd7fb478ff23cd752026eb609f25ef91cc36cb1b55900db9f182f4aeb47b5')

package() {
    cd "${srcdir}/linear-${CARCH}-unknown-linux-gnu"
    
    # Install the binary
    install -Dm755 "linear" "${pkgdir}/usr/bin/linear"
    
    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    
    ./linear completions bash > "${pkgdir}/usr/share/bash-completion/completions/linear"
    ./linear completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/linear.fish"
    ./linear completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_linear"
    
    # Install the license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install README
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
