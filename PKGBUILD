# Maintainer: Varalys <chris@varalys.com>
pkgname=lore-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Reasoning history for code. Capture AI coding sessions, trace any line to the AI conversation that produced it, and sync it through your own git remotes."
arch=('x86_64' 'aarch64')
url="https://github.com/varalys/lore"
license=('Apache-2.0')
provides=('lore-cli' 'lore')
conflicts=('lore-cli' 'lore')
depends=('gcc-libs')
options=(!debug)
install=lore-cli-bin.install

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/varalys/lore/releases/download/v${pkgver}/lore-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/varalys/lore/releases/download/v${pkgver}/lore-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('f476da4c563b30da9ef9bca461a7bac0a4811ef89b901ec3680ce0b9ef97b9e4')
sha256sums_aarch64=('b46ff915fc667edf10ba8f003c0545134de4f6c38478f8dc4e330174d3a97b15')

package() {
    install -Dm755 lore "${pkgdir}/usr/bin/lore"

    # Generate and install shell completions
    "${srcdir}/lore" completions bash > lore.bash
    "${srcdir}/lore" completions zsh > _lore
    "${srcdir}/lore" completions fish > lore.fish

    install -Dm644 lore.bash "${pkgdir}/usr/share/bash-completion/completions/lore"
    install -Dm644 _lore "${pkgdir}/usr/share/zsh/site-functions/_lore"
    install -Dm644 lore.fish "${pkgdir}/usr/share/fish/vendor_completions.d/lore.fish"
}
